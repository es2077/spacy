import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import cookie from "cookie";

export default async function (req, res) {
  try {
    const { password, email } = req.body.input.input;
    const result = await fetch(process.env.NEXT_HASURA_GRAPHQL_API, {
      method: "POST",
      headers: {
        "x-hasura-admin-secret": process.env.HASURA_ADMIN_SECRET,
      },
      body: JSON.stringify({
        query: `
          query {
            usersConnection(where: {email: {_eq: "${email}"}}) {
              edges {
                node {
                  id
                  password
                }
              }
              pageInfo {
                startCursor
              }
            }
          }
        `,
        variables: null,
      }),
    }).then((res) => res.json());

    const user = result.data.usersConnection.edges[0];
    const isValid = user
      ? await bcrypt.compare(password, user.node.password)
      : false;

    if (!isValid) {
      res.status(200).json({
        token: false,
        error: "Invalid login",
      });
    } else {
      const token = jwt.sign(
        {
          email,
          "https://hasura.io/jwt/claims": {
            "x-hasura-allowed-roles": ["user"],
            "x-hasura-default-role": "user",
            "x-hasura-user-email": email,
          },
        },
        process.env.HASURA_SECRET,
        {
          expiresIn: "7d",
        }
      );

      const authCookie = cookie.serialize("spacy_auth", token, {
        path: "/",
        httpOnly: true,
        maxAge: 60 * 60 * 24 * 7, // 1 week
      });

      // set cookies
      res.setHeader("Set-Cookie", authCookie);
      res.status(200).json({
        token,
        error: null,
      });
    }
  } catch (e) {
    console.log(e);
    res.status(500).json({
      token: null,
      error: "Something went wrong",
    });
  }
}
