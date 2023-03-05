package foo.bar;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import net.plsar.annotations.Component;
import net.plsar.annotations.NetworkRouter;
import net.plsar.annotations.network.Get;
import net.plsar.annotations.network.Post;
import net.plsar.model.NetworkRequest;
import net.plsar.model.RequestComponent;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

@NetworkRouter
public class IdentityRouter {

    @Get("/")
    public String index(NetworkRequest req){
        System.out.println("zi");
        return "signin.jsp";
    }

    @Get("/signin")
    public String signin(NetworkRequest req){
        System.out.println("zn");
        return "redirect:/";
    }

    @Post("/")
    public String idx(NetworkRequest req) throws GeneralSecurityException, IOException {
        String token = req.getValue("credential");
        getUserProfileDetails(token, req);
        return "redirect:/";
    }

    @Post("/signin")
    public String post(NetworkRequest req) throws GeneralSecurityException, IOException {
        String token = req.getValue("credential");
        getUserProfileDetails(token, req);
        return "redirect:/";
    }

    void getUserProfileDetails(String token, NetworkRequest req) throws GeneralSecurityException, IOException {

        System.out.println(token);
        for(RequestComponent component : req.getRequestComponents()){
            System.out.println(component.getName() + ":" + component.getValue());
        }

        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), GsonFactory.getDefaultInstance())
                // Specify the CLIENT_ID of the app that accesses the backend:
                .setAudience(Collections.singletonList("853775900865-shi5quv3nosocpv93dre4cpq5kqe9q19.apps.googleusercontent.com"))
                // Or, if multiple clients access the backend:
                //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                .build();

        GoogleIdToken idToken = verifier.verify(token);
        if (idToken != null) {
            GoogleIdToken.Payload payload = idToken.getPayload();

            // Print user identifier
            String userId = payload.getSubject();
            System.out.println("User ID: " + userId);

            // Get profile information from payload
            String email = payload.getEmail();
            boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
            String name = (String) payload.get("name");
            String pictureUrl = (String) payload.get("picture");
            String locale = (String) payload.get("locale");
            String familyName = (String) payload.get("family_name");
            String givenName = (String) payload.get("given_name");

            // Use or store profile information
            System.out.println(email + ":"  + emailVerified + ":" + name + ":" + pictureUrl + ":" + locale + ":" + familyName + ":" + givenName);

        } else {
            System.out.println("Invalid ID token.");
        }
    }
}
