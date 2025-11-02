import "./globals.css";
import { cookies } from "next/headers";
import { Providers } from "./providers";
import EmotionRegistry from "./emotion-registry";

export const metadata = {
  title: "Spacy",
  description: "A ReScript + Relay + Next.js teaching project",
};

export default async function RootLayout({ children }) {
  // Read auth token from cookies on the server
  const cookieStore = await cookies();
  const authToken = cookieStore.get("spacy_auth")?.value;

  return (
    <html lang="en">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link
          rel="preconnect"
          href="https://fonts.gstatic.com"
          crossOrigin="true"
        />
        <link
          href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&display=swap"
          rel="stylesheet"
        />
      </head>
      <body>
        <EmotionRegistry>
          <Providers authToken={authToken}>{children}</Providers>
        </EmotionRegistry>
      </body>
    </html>
  );
}
