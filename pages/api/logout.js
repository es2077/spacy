import cookie from "cookie";

export default async function (req, res) {
  try {
    // Clear the auth cookie by setting it with maxAge=0
    const authCookie = cookie.serialize("spacy_auth", "", {
      path: "/",
      httpOnly: true,
      maxAge: 0, // Expire immediately
    });

    res.setHeader("Set-Cookie", authCookie);
    res.status(200).json({ success: true });
  } catch (e) {
    console.log(e);
    res.status(500).json({
      success: false,
      error: "Something went wrong",
    });
  }
}
