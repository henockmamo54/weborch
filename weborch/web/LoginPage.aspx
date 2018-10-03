<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="web.LoginPage" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        var x = document.getElementById("mastermaincontent");
        x.className = "col-md-12"

        var x = document.getElementById("masterNavigationBar");
        x.style.display = "none";

        var x = document.getElementById("mastersidemenu");
        x.style.display = "none";
        //var x = document.getElementById("masterFooter");
        //x.style.display = "none";

        var serachbar = document.getElementById("masterserachbar");
        serachbar.style.display = "none";
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="card card-container" style="background: white; border-top: 1px solid lightgray;">
                    <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                    <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin" defaultbutton="Button1_signin">
                        <span id="reauth-email" class="reauth-email"></span>
                        <asp:TextBox type="text" ID="inputEmail" class="form-control" placeholder="<%$Resources:HomeView.aspx,Email %>" required autofocus Style="margin-bottom: 0.7em;" runat="server"></asp:TextBox>
                        <asp:TextBox type="password" ID="inputPassword" class="form-control" placeholder="<%$Resources:HomeView.aspx,Password %>" required Style="margin-bottom: 0.7em;" runat="server"></asp:TextBox>

                        <asp:Label Style="color: red" ID="Label1_warnningmessage" runat="server" Text="Label" Visible="false">Login not successful. please check your login information.</asp:Label>
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox">
                                <asp:CheckBox ID="CheckBox1" runat="server" value="remember-me" />
                                <%= Resources.HomeView.aspx.Rememberme %>
                            </label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <asp:Button class="btn btn-lg btn-primary btn-block btn-signin" ID="Button1_signin" runat="server" Text="<%$Resources:HomeView.aspx,SignIn %>" OnClick="Button1_signin_Click1" />

                    </form>
                    <!-- /form -->
                    <a href="#" class="forgot-password"><%= Resources.HomeView.aspx.Forgotthepassword %>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick='redirect()'><%= Resources.HomeView.aspx.SignUp %></asp:LinkButton>
                    </a>
                </div>
                <!-- /card-container -->
            </div>

        </ContentTemplate>
        <%--<Triggers>
            <asp:PostBackTrigger ControlID="Button1_signin" />
        </Triggers>--%>
    </asp:UpdatePanel>

    <script type="text/javascript">

        

        document.getElementById("signuptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("signuptab").style.borderRight = "none";


        var x = document.getElementById("mastermaincontent");
        x.className = "col-md-12"

        var x = document.getElementById("masterNavigationBar");
        x.style.display = "none";

        var x = document.getElementById("mastersidemenu");
        x.style.display = "none";
        //var x = document.getElementById("masterFooter");
        //x.style.display = "none";

        var serachbar = document.getElementById("masterserachbar");
        serachbar.style.display = "none";

        //window.onbeforeunload = function () {
        //    alert("closing");
        //    console.log("halhaha");
        //    var backlen = history.length;
        //    history.go(-backlen);
        //}

        //window.addEventListener("beforeunload", function (e) {
        //    alert("closing");
        //    console.log("halhaha");
        //    var backlen = history.length;
        //    history.go(-backlen);
        //}, false);

        function redirect() {
            //location.href = 'UserPage.aspx';
            location.href = 'Views/signupPages/TermsOfUsePage.aspx';
        }

    </script>



    <style>
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            /*background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
        }

        .card-container.card {
            max-width: 350px;
            padding: 40px 40px;
        }

        .btn {
            font-weight: 700;
            height: 36px;
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
            cursor: default;
        }

        /*
 * Card component
 */
        .card {
            background-color: #F7F7F7;
            /* just in case there no content*/
            padding: 20px 25px 30px;
            margin: 0 auto 25px;
            margin-top: 50px;
            /* shadows and rounded borders */
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }

        .profile-img-card {
            width: 96px;
            height: 96px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }

        /*
 * Form styles
 */
        .profile-name-card {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin: 10px 0 0;
            min-height: 1em;
        }

        .reauth-email {
            display: block;
            color: #404040;
            line-height: 2;
            margin-bottom: 10px;
            font-size: 14px;
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .form-signin #inputEmail,
        .form-signin #inputPassword {
            direction: ltr;
            height: 44px;
            font-size: 16px;
        }

        .form-signin input[type=email],
        .form-signin input[type=text],
        .form-signin input[type=password],
        .form-signin input[type=text],
        .form-signin button {
            width: 100%;
            display: block;
            margin-bottom: 10px;
            z-index: 1;
            position: relative;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .form-signin .form-control:focus {
            border-color: rgb(104, 145, 162);
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
        }

        .btn.btn-signin {
            /*background-color: #4d90fe; */
            background-color: rgb(104, 145, 162);
            /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
            padding: 0px;
            font-weight: 700;
            font-size: 14px;
            height: 36px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            border: none;
            -o-transition: all 0.218s;
            -moz-transition: all 0.218s;
            -webkit-transition: all 0.218s;
            transition: all 0.218s;
        }

            .btn.btn-signin:hover,
            .btn.btn-signin:active,
            .btn.btn-signin:focus {
                background-color: rgb(12, 97, 33);
            }

        .forgot-password {
            color: rgb(104, 145, 162);
        }

            .forgot-password:hover,
            .forgot-password:active,
            .forgot-password:focus {
                color: rgb(12, 97, 33);
            }
    </style>

</asp:Content>
