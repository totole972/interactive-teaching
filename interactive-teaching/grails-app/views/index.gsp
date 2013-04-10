<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title></title>
        <style type="text/css" media="screen">
            #status {
                background-color: #eee;
                border: .2em solid #fff;
                margin: 2em 2em 1em;
                padding: 1em;
                width: 12em;
                float: left;
                -moz-box-shadow: 0px 0px 1.25em #ccc;
                -webkit-box-shadow: 0px 0px 1.25em #ccc;
                box-shadow: 0px 0px 1.25em #ccc;
                -moz-border-radius: 0.6em;
                -webkit-border-radius: 0.6em;
                border-radius: 0.6em;
            }

            .ie6 #status {
                display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
            }

            #status ul {
                font-size: 0.9em;
                list-style-type: none;
                margin-bottom: 0.6em;
                padding: 0;
            }

            #status li {
                line-height: 1.3;
            }

            #status h1 {
                text-transform: uppercase;
                font-size: 1.1em;
                margin: 0 0 0.3em;
            }

            #page-body {
                margin: 2em 1em 1.25em 18em;
            }

            h2 {
                margin-top: 1em;
                margin-bottom: 0.3em;
                font-size: 1em;
            }

            p {
                line-height: 1.5;
                margin: 0.25em 0;
            }
            
            input, textarea {
                padding: 9px;
                border: solid 1px #E5E5E5;
                outline: 0;
                font: normal 13px/100% Verdana, Tahoma, sans-serif;
                width: 200px;
                box-shadow: rgba(0,0,0,0.1) 0px 0px 8px;
                -moz-box-shadow: rgba(0,0,0,0.1) 0px 0px 8px;
                -webkit-box-shadow: rgba(0,0,0,0.1) 0px 0px 8px;
                background: #FFFFFF url('bg_form.png') left top repeat-x;
                background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF));
            }
            
            textarea {
                width: 400px;
                max-width: 400px;
                height: 150px;
                line-height: 150%;
            }
            
            input:focus, textarea:focus {
                border-color: #C9C9C9;
                -webkit-box-shadow: rgba(0, 0, 0, 0.15) 0px 0px 8px;
            }
            
            .button {
                display: inline-block;
			    outline: none;
			    cursor: pointer;
			    text-align: center;
			    text-decoration: none;
			    font: 14px/100% Arial, Helvetica, sans-serif;
			    padding: .5em 2em .55em;
			    text-shadow: 0 1px 1px rgba(0,0,0,.3);
			    -webkit-border-radius: .5em; 
			    -moz-border-radius: .5em;
			    border-radius: .5em;
			    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
			    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
			    box-shadow: 0 1px 2px rgba(0,0,0,.2);
			}
			
			.button:hover {
			    text-decoration: none;
			}
			
			.button:active {
			    position: relative;
			    top: 1px;
			}
			
			.red {
			    color: #faddde;
			    border: solid 1px #980c10;
			    background: #d81b21;
			    background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));
			    background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);
			    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');
			}
			.red:hover {
			    background: #b61318;
			    background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));
			    background: -moz-linear-gradient(top,  #c9151b,  #a11115);
			    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115');
			}
			.red:active {
			    color: #de898c;
			    background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));
			    background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);
			    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');
			}

            #controller-list ul {
                list-style-position: inside;
            }

            #controller-list li {
                line-height: 1.3;
                list-style-position: inside;
                margin: 0.25em 0;
            }

            @media screen and (max-width: 480px) {
                #status {
                    display: none;
                }

                #page-body {
                    margin: 0 1em 1em;
                }

                #page-body h1 {
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>
        <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="status" role="complementary">
            <h1>Application Status</h1>
            <ul>
                <li>App version: <g:meta name="app.version"/></li>
                <li>Grails version: <g:meta name="app.grails.version"/></li>
                <li>Groovy version: ${GroovySystem.getVersion()}</li>
                <li>JVM version: ${System.getProperty('java.version')}</li>
                <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
            </ul>
            <h1>Installed Plugins</h1>
            <ul>
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li>${plugin.name} - ${plugin.version}</li>
                </g:each>
            </ul>
        </div>
        <div id="page-body" role="main">
            <h1>Welcome to Grails</h1>
            
            <div id="login">
                <p class="email">
                    <input type="text" name="useremail" placeholder="Your email"/>
                </p>
                <p class="password">
                    <input type="text" name="password" placeholder="Your password"/>
                </p>
                <p class="submit">
                    <button type="submit" class="button red">Login</button>
                </p>
            </div>
            
            <p>Congratulations, you have successfully started your first Grails application! At the moment
               this is the default page, feel free to modify it to either redirect to a controller or display whatever
               content you may choose. Below is a list of controllers that are currently deployed in this application,
               click on each to execute its default action:</p>

            <div id="controller-list" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
