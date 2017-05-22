import com.etrade.etws.account.Account;
 import com.etrade.etws.account.AccountListResponse;
 import com.etrade.etws.oauth.sdk.client.IOAuthClient;
 import com.etrade.etws.oauth.sdk.client.OAuthClientImpl;
 import com.etrade.etws.oauth.sdk.common.Token;
 import com.etrade.etws.sdk.client.ClientRequest;
 
 // Variables
 public IOAuthClient client = null;
 public ClientRequest request = null;
 public Token token = null;
 public String oauth_consumer_key = null; // Your consumer key
 public String oauth_consumer_secret = null; // Your consumer secret
 public String oauth_request_token = null; // Request token 
 public String oauth_request_token_secret = null; // Request token secret
 client = OAuthClientImpl.getInstance(); // Instantiate IOAUthClient
 request = new ClientRequest(); // Instantiate ClientRequest
 request.setEnv(Environment.SANDBOX); // Use sandbox environment
 
 request.setConsumerKey(oauth_consumer_key); //Set consumer key
 request.setConsumerSecret(oauth_consumer_secret); // Set consumer secret
 token= client.getRequestToken(request); // Get request-token object
 oauth_request_token  = token.getToken(); // Get token string
 oauth_request_token_secret = token.getSecret(); // Get token secret

Obtain a verification code
The next section of code redirects your user to E*TRADE for authorization. Upon successful login, the E*TRADE page displays information to user about your application's request for access. If the user approves, the page displays a verification code.

import java.awt.Desktop;
 import java.net.URI;
 
 String authorizeURL = null;
 authorizeURL = client.getAuthorizeUrl(request); // E*TRADE authorization URL
 URI uri = new java.net.URI(authorizeURL);
 Desktop desktop = Desktop.getDesktop();
 desktop.browse(authorizeURL);
 
 public String oauth_access_token = null; // Variable to store access token 
 public String oauth_access_token_secret = null; // Variable to store access token secret
 public String oauth_verify_code = "Your verification_code"; // Should contain the Verification Code received from the authorization step
 
 request = new ClientRequest(); // Instantiate ClientRequest
 request.setEnv(Environment.SANDBOX); // Use sandbox environment
 // Prepare request
 request.setConsumerKey(oauth_consumer_key); // Set consumer key
 request.setConsumerSecret(oauth_consumer_secret); // Set consumer secret
 request.setToken(oauth_request_token); // Set request token
 request.setTokenSecret(oauth_request_token_secret); // Set request-token secret
 request.setVerifierCode(oauth_verify_code); // Set verification code
 
 // Get access token
 token = client.getAccessToken(request); // Get access-token object
 oauth_access_token = token.getToken(); // Access token string
 oauth_access_token_secret = token.getSecret(); // Access token secret
