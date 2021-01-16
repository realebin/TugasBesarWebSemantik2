<%@ page import="org.apache.jena.rdf.model.*" %>
<%@ page import="org.apache.jena.vocabolary.*" %>
<%@ page import="org.apache.jena.update.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="org.apache.jena.query.*" %>
<%@ page import="org.apache.jena.query.ResultSetFormatter" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="org.apache.jena.query.QueryExecution" %>
<%@ page import="org.apache.jena.query.ResultSet" %>
<%@ page import="org.apache.jena.update.UpdateFactory" %>
<%@ page import="org.apache.jena.update.UpdateRequest" %>
<%@ page import="org.apache.jena.rdfconnection.*" %>

<%
    Model model = ModelFactory.createDefaultModel();
    model.read("C:/xampp/tomcat/webapps/SPARQL2/jobs.rdf");
    model.read("C:/xampp/tomcat/webapps/SPARQL2/people.rdf");
    model.read("C:/xampp/tomcat/webapps/SPARQL2/employment.rdf");

	////////////////////CONSTRUCT////////////////////
	/*  String perintahSPARQL = "PREFIX xmlns: <http://example.org#> PREFIX e: <http://jyu.fi/employment#> CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}";
	Query query = QueryFactory.create(perintahSPARQL);
	QueryExecution qe = QueryExecutionFactory.create(query,model);
	model = qe.execConstruct();
	model.write(out, "RDF/XML-ABBREV"); */

	////////////////////DESCRIBE////////////////////
	/* 	String perintahSPARQL2 = "PREFIX xmlns: <http://example.org#> describe ?person where { ?person xmlns:firstName 'John' }";
	Query query = QueryFactory.create(perintahSPARQL2);
	QueryExecution qe = QueryExecutionFactory.create(query,model);
	model = qe.execDescribe();
	model.write(out, "RDF/XML-ABBREV"); */

	///////////////////////ASK//////////////////////
 	  String perintahSPARQL2 = "PREFIX xmlns: <http://example.org#> ask where { xmlns:john xmlns:firstName 'John' }";
	Query query = QueryFactory.create(perintahSPARQL2);
	QueryExecution qe = QueryExecutionFactory.create(query,model);
	Boolean hasil = qe.execAsk();
	out.println(hasil.toString()); 
	
	////////////////////SELECT ALL//////////////////
	/*  String perintahSPARQL = "SELECT ?S ?P ?O WHERE{?S ?P ?O}";
	Query query2 = QueryFactory.create(perintahSPARQL);
	QueryExecution qe2 = QueryExecutionFactory.create(query2,model);
	ResultSet rs = qe2.execSelect() ;
	model.write(out, "RDF/XML-ABBREV");  */

	//////////////////////ADD///////////////////////
	/*  String add = "PREFIX f: <http://example.org#> \n"
                + "INSERT DATA {\n"
                + "    f:mary f:hasFriend f:jane .\n"
                + "}";
	UpdateAction.parseExecute(add, model) ;
	model.write(out, "RDF/XML-ABBREV"); */

	/////////////////////DELETE/////////////////////
	 /*String delete = "PREFIX f: <http://example.org#> \n"
                + "DELETE WHERE {\n"
                + "?x f:hasFriend ?y .\n"
                + "}";
	UpdateAction.parseExecute(delete, model) ;
	model.write(out, "RDF/XML-ABBREV"); */

%>