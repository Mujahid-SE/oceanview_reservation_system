<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ocean View Resort - Sign Up</title>

<style>

body{
    margin:0;
    font-family:Arial, Helvetica, sans-serif;
    background:linear-gradient(120deg,#00b4d8,#90e0ef);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    background:white;
    padding:40px;
    width:380px;
    border-radius:14px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:#0077b6;
    margin-bottom:25px;
}

/* LABELS */
label{
    font-weight:bold;
    display:block;
    margin-top:10px;
    margin-bottom:5px;
}

/* INPUTS */
input,
select{
    width:100%;
    padding:14px 12px;
    border-radius:10px;
    border:1px solid #ccc;
    font-size:15px;
    background:#f1f5f9;
    box-sizing:border-box;
}

input:focus,
select:focus{
    outline:none;
    border-color:#0077b6;
    box-shadow:0 0 5px rgba(0,119,182,0.3);
}

/* PASSWORD FIELD */
.password-wrapper{
    position:relative;
}

.toggle-eye{
    position:absolute;
    right:12px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    font-size:18px;
}

/* DROPDOWN FIX */
.select-wrapper{
    position:relative;
}

.select-wrapper::after{
    content:"▼";
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    pointer-events:none;
    font-size:12px;
    color:#555;
}

select{
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    cursor:pointer;
}

/* BUTTON */
button{
    width:100%;
    margin-top:20px;
    padding:14px;
    background:#0096c7;
    color:white;
    border:none;
    border-radius:10px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#023e8a;
}

/* MESSAGES */
.success{color:green;text-align:center;}
.error{color:red;text-align:center;}

#strengthMsg{
    font-weight:bold;
    text-align:center;
    margin-top:8px;
}

/* LINK */
a{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#0077b6;
    font-weight:bold;
}

</style>

<script>

/* Show / Hide Password */
function togglePassword(){
    const pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}

/* Password Strength Checker */
function checkStrength(){

    const value = document.getElementById("password").value;
    const msg = document.getElementById("strengthMsg");

    let strength = 0;

    if(value.length >= 8) strength++;
    if(/[A-Z]/.test(value)) strength++;
    if(/[0-9]/.test(value)) strength++;
    if(/[!@#$%^&*]/.test(value)) strength++;

    if(value.length === 0){
        msg.innerHTML="";
        return;
    }

    if(strength <= 1){
        msg.innerHTML="Weak password";
        msg.style.color="red";
    }
    else if(strength <=3){
        msg.innerHTML="Medium password";
        msg.style.color="orange";
    }
    else{
        msg.innerHTML="Strong password ✓";
        msg.style.color="green";
    }
}

</script>
</head>

<body>

<div class="container">

<h2>Create Account</h2>

<form action="signup" method="post">

<label>Username</label>
<input type="text" name="username" placeholder="Enter username" required>

<label>Password</label>
<div class="password-wrapper">
    <input type="password" id="password" name="password"
           placeholder="Enter password"
           oninput="checkStrength()" required>
    <span class="toggle-eye" onclick="togglePassword()">👁</span>
</div>

<p id="strengthMsg"></p>

<label>Select Role</label>
<div class="select-wrapper">
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="staff">Staff</option>
        <option value="admin">Admin</option>
    </select>
</div>

<button type="submit">Register</button>

</form>

<% if("true".equals(request.getParameter("success"))){ %>
<p class="success">Account created successfully!</p>
<% } %>

<% if("true".equals(request.getParameter("error"))){ %>
<p class="error">Username already exists!</p>
<% } %>

<a href="login.jsp">Back to Login</a>

</div>

</body>
</html>