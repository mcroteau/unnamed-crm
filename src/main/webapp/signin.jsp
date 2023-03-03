<div id="g_id_onload"
     data-client_id="853775900865-shi5quv3nosocpv93dre4cpq5kqe9q19.apps.googleusercontent.com"
     data-context="use"
     data-ux_mode="popup"
     data-login_uri="http://localhost:9000"
     data-auto_prompt="false">
</div>

<div class="g_id_signin"
     data-type="standard"
     data-shape="pill"
     data-theme="outline"
     data-text="signin_with"
     data-size="large"
     data-logo_alignment="left">
</div>
<script src="https://accounts.google.com/gsi/client"></script>

<a href="javascript:" id="google_signout">Signout</a>
<script>
    let signoutBtn = document.getElementById("google_signout");
    signoutBtn.addEventListener("click", handleCredentialResponse);

    google.accounts.id.initialize({
        client_id: '853775900865-shi5quv3nosocpv93dre4cpq5kqe9q19.apps.googleusercontent.com',
        callback: handleCredentialResponse
    });
    function handleCredentialResponse() {
        google.accounts.id.revoke('croteau.mike@gmail.com', done => {
            console.log('consent revoked');
        });
    }
</script>