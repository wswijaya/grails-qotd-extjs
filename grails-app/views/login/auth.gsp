<head>
<meta name='layout' content='main' />
<title>Login</title>
    <link rel="stylesheet" href="${resource(dir:'ext-4.0.2/resources/css',file:'ext-all.css')}" />
	<script type="text/javascript" src="${resource(dir:'ext-4.0.2',file:'ext-all.js')}"></script>

	<script type="text/javascript">
		var defLoginUrl = '${postUrl}';
		var homeUrl = '${createLink(uri: "/quote/random")}';
	</script>	
	<style type="text/css">
		.my-form-class {
			margin:  20px 30px;
		}
	</style>
</head>

<body>
	<div id='login'>
	</div>
<script type='text/javascript'>
<!--
Ext.onReady(function(){
	Ext.QuickTips.init();
	
	var loginForm = Ext.create('Ext.form.Panel',{
			url: defLoginUrl,
			title: 'Login',
			renderTo: 'login',
			frame: true,
			cls: 'my-form-class',
			width: 350,
			items: [{
					xtype: 'textfield',
					fieldLabel: 'Login',
					name: 'j_username'
			},{
					xtype: 'textfield',
					inputType: 'password',
					fieldLabel: 'Password',
					name: 'j_password'
			}, {
				xtype: 'checkbox',
				fieldLabel: 'Remember Me?',
				name: '_spring_security_remember_me',
				checked: false
			}],
			buttons: [{
					id: 'lf.btn.login',
					text: 'Login',
					handler: function() {
						fnLoginForm(loginForm);
					}
				},{
					id: 'lf.btn.reset',
					text: 'Reset',
					handler: function() {
						fnResetForm(loginForm);
					}
			}]
	});

});

function fnLoginForm(theForm) 
{
	theForm.getForm().submit({
		success: function(form, action) {
			Ext.Msg.alert('Success', 'Login Successful!', function(btn, text) {
				if (btn == 'ok') {
					window.location = homeUrl;	//optionally this can be part of the data return by the server.
				}
			});
		},
		failure: function(form, action) {
			Ext.Msg.alert('Warning', action.result.error); 
		}
	});
} //end fnLoginForm

function fnResetForm(theForm)
{
	theForm.getForm().reset();
} //end fnResetForm
// -->
</script>
</body>
