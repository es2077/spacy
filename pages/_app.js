import '../app/globals.css';
import { Providers } from '../app/providers';
import EmotionRegistry from '../app/emotion-registry';

function App({ Component, pageProps, authToken }) {
  return (
    <EmotionRegistry>
      <Providers authToken={authToken}>
        <Component {...pageProps} />
      </Providers>
    </EmotionRegistry>
  );
}

App.getInitialProps = async ({ ctx }) => {
  // Read auth token from cookies on the server
  const authToken = ctx.req?.headers.cookie
    ?.split(';')
    .find(c => c.trim().startsWith('spacy_auth='))
    ?.split('=')[1];

  return { authToken };
};

export default App;
