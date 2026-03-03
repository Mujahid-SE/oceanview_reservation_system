<!DOCTYPE html>
<html>
<head>
<title>Ocean View Resort Login</title>

<style>

body{
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#0f7fa3,#1fb6d5);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.login-container{
    background:#fff;
    padding:40px;
    border-radius:15px;
    width:350px;
    box-shadow:0 8px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:#0f4c81;
    margin-bottom:25px;
}

/* LABELS */
label{
    font-weight:bold;
    display:block;
    margin-top:15px;
    margin-bottom:5px;
}

/* NORMAL INPUT */
.input-field{
    width:100%;
    padding:12px;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:15px;
    box-sizing:border-box;
}

/* PASSWORD WRAPPER */
.password-wrapper{
    position:relative;
    width:100%;
}

/* PASSWORD INPUT */
.password-wrapper input{
    width:100%;
    padding:12px;
    padding-right:40px; /* space for eye */
    border-radius:8px;
    border:1px solid #ccc;
    box-sizing:border-box;
}

/* EYE BUTTON */
.toggle-password{
    position:absolute;
    right:10px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    background:none;
    border:none;
    font-size:16px;
}

/* BUTTON */
.login-btn{
    width:100%;
    margin-top:25px;
    padding:12px;
    background:#1677a6;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
}

.login-btn:hover{
    background:#125f86;
}

.link{
    text-align:center;
    margin-top:15px;
}

</style>

<script>
function togglePassword(){

    const pass = document.getElementById("password");
    const icon = document.getElementById("eyeIcon");

    if(pass.type === "password"){
        pass.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    }else{
        pass.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}
</script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>

<body>

<div class="login-container">

<h2>Ocean View Resort Login</h2>

<form action="login" method="post">

    <label>Username</label>
    <input type="text" name="username" class="input-field" required>

    <label>Password</label>

    <div class="password-wrapper">
        <input type="password" id="password" name="password" required>

       <button type="button"
        class="toggle-password"
        onclick="togglePassword()">

    <i class="fa-solid fa-eye" id="eyeIcon"></i>

</button>
    </div>

    <button type="submit" class="login-btn">Login</button>

</form>

<div class="link">
    <a href="signup.jsp">Create Account</a>
</div>

</div>

</body>
</html>