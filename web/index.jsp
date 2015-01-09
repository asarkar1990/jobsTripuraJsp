<%-- 
    Document   : index
    Created on : 10 Jan, 2015, 12:45:51 AM
    Author     : arindam
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>jobsTripura: Online job portal of Tripura</title>
        <meta charset="utf-8">
        <meta name="google-site-verification" content="sxorYJik9URjGahWueXh9ZZ_V8uOhdiJoXiOJQqFJ8I" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="mystyle.css"> 
        <script type="text/javascript" src="myscript.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="http://jobstripura.github.io/"><span style="color:red; font-size:1.8em">jobs</span><span style="color:white; font-size:1.5em">Tripura</span></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">     
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="postjob.html"><span class="glyphicon glyphicon-pencil"></span> Post job</a></li>
                        <li><a href="contact.html"><span class="glyphicon glyphicon-envelope"></span> Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="text-align: center">

            <div class="row" style="background-color:#00B8e6;" >
                <div class="col-xs-12 col-md-2"><h4>Serial no.</h4></div>
                <div class="col-xs-12 col-md-6" style="border-right:1px solid aqua;border-left:1px solid aqua;"><h4>Post Name</h4></div>
                <div class="col-xs-12 col-md-4"><h4>Last date</h4></div>           
            </div>
            <div class="panel-group" id="accordion">  
                <%
                    Connection con;
                    Statement st;
                    ResultSet rs;
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DB_JOBSTRIPURA", "arindam", "linux");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM tbl_jobs ORDER BY key_column DESC;");
                    int pnlId = 0;
                    while (rs.next()) {
                        String postname = rs.getString("postname");
                        String vacancies = rs.getString("vacancies");
                        String postingdate = rs.getString("postingdate");
                        String lastdate = rs.getString("lastdate");
                        String eligibility = rs.getString("eligibility");
                        String location = rs.getString("location");
                        String jobcatagory = rs.getString("jobcatagory");
                        String jobtype = rs.getString("jobtype");
                        String hiringprocess = rs.getString("hiringprocess");
                        String link = rs.getString("link");
                        String jobstatus = rs.getString("salary");
                        String agelimit = rs.getString("agelimit");
                        String companyname = rs.getString("companyname");
                        String contact = rs.getString("contact");
                %>
                <!--job panel startes bellow-->   
                <div class="panel panel-default">
                    <div class="panel-heading row" data-toggle="collapse" data-parent="#accordion" href="#pnl<%=pnlId%>">
                        <div class="col-xs-12 col-md-2 panel-title"><p class="badge jobno"></p></div>
                        <!----NEW JOB----->
                        <div class="col-xs-12 col-md-6 panel-title">
                            <!------JOB TITLE--->
                            <%=postname%>

                            <!------JOB TITLE---></div>
                        <div class="col-xs-12 col-md-4 panel-title">
                            <!---LAST DATE--->
                            <%=lastdate%> 
                            <span class="btn-danger">
                                <!---JOB STATUS (New/ Open/ Closed)--->
                                New            
                                <!---JOBSTATUS--->
                            </span>
                        </div>
                    </div>     
                    <div id="pnl<%=pnlId%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="jobdetails">
                                <!---JOB DATA--->
                                <h4><!---job title---> <%=postname%><!---job title---> </h4>
                                <h5>Date Of Posting: <!---DOP---><%=postingdate %><!---DOP---></h5>
                                <hr>               
                                <p>Eligibility : <%=eligibility %></p>
                                <p>Location : <%=location %><p>
                                <p>Job Category :<%=jobcatagory %></p>
                                <p>Last Date :<%=lastdate %></p>
                                <p>Job Type : <%=jobtype %></p>
                                <p>Hiring Process : <%=hiringprocess %></p>            
                                <p>
                                    <!---DOWNLOAD LINK--->
                                    <a  href="<%=link %>" target="_blank">
                                        Download Notification
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>  
                <% pnlId++;
                    }%> 
            </div> 
            <!--end of JOB panel -->           

        </div> 
        <!----script------>
        <script type="text/javascript">
            var job = document.getElementsByClassName("jobno");
            var i;
            for (i = 0; i < job.length; i++)
            {
                job[i].innerHTML = i + 1;
            }
        </script>


        <!----end ------>

        <!-- Start of StatCounter Code for Default Guide -->
        <script type="text/javascript">
            var sc_project = 10223101;
            var sc_invisible = 1;
            var sc_security = "c7f3ad1d";
            var scJsHost = (("https:" == document.location.protocol) ?
                    "https://secure." : "http://www.");
            document.write("<sc" + "ript type='text/javascript' src='" +
                    scJsHost +
                    "statcounter.com/counter/counter.js'></" + "script>");
        </script>
        <noscript><div class="statcounter"><a title="hits counter"
                                              href="http://statcounter.com/" target="_blank"><img
                    class="statcounter"
                    src="http://c.statcounter.com/10223101/0/c7f3ad1d/1/"
                    alt="hits counter"></a></div></noscript>
        <!-- End of StatCounter Code for Default Guide -->

    </body>
</html>