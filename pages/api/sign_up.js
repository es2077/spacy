import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

export default async function (req, res) {
  try {
    const input = {
      ...req.body.input.input,
      password: await bcrypt.hash(req.body.input.input.password, 10),
    };
    const result = await fetch(process.env.NEXT_HASURA_GRAPHQL_API, {
      method: "POST",
      headers: {
        "x-hasura-admin-secret": process.env.HASURA_ADMIN_SECRET,
      },
      body: JSON.stringify({
        query: `
          mutation InsertUserMutation($input: UsersInsertInput!) {
            insertUsersOne(object: $input) {
              id
            }
          }
        `,
        variables: {
          input,
        },
      }),
    }).then((res) => res.json());

    if (result.errors) {
      return res.status(200).json({
        token: false,
        error: result.errors[0].message,
      });
    }

    const token = jwt.sign(
      {
        email: req.body.input.input.email,
        "https://hasura.io/jwt/claims": {
          "x-hasura-allowed-roles": ["user"],
          "x-hasura-default-role": "user",
          "x-hasura-user-email": input.email,
        },
      },
      process.env.HASURA_SECRET,
      {
        expiresIn: "7d",
      }
    );

    res.setHeader("Set-Cookie", `spacy_auth=${token}; HttpOnly; Path=/`);

    res.status(200).json({
      token,
      error: result.errors ? result.errors[0].message : null,
    });
  } catch (e) {
    console.log(e);
    res.status(200).json({
      token: false,
      error: "Something went wrong",
    });
  }
}
