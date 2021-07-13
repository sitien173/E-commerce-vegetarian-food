# Ecommerce Website Vegetarian - An amazing website [Demo](http://demo-env.eba-kinybp2w.us-east-2.elasticbeanstalk.com/)


We developed an end to end **Ecommerce web Application using Spring MVC** with multiple
modules

## Project is not maintained anymore [here](http://demo-env.eba-kinybp2w.us-east-2.elasticbeanstalk.com/)

### Functionalities:

1. **Authentication and authotizes**.
* Login with username and password
* registration auto send mail token authentication

2. **CRUD Operations** like

* User can add product to their cart and purchase summary.
* Admin can add product to the product list.
* Admin can edit the product details.
* Admin can delete the product from the list.
* ...

3. **Check out**

* User can check out with cod and paypal
* All successful transactions have history
* Easy invoice lookup

4. **Spring Security**

* User can login into the site.
* The entire site will change according to the role, depending on whether the client is User or Admin.
* User can logout after completing.

5. **Spring WebFlow**

* After adding products the cart the User can checkout using spring WebFlow.
* Confirming User Details.
* Confirming Shipping and Billing Address.
* Receipt.
* If the user cancels the webflow, it will go to cancel Page.
* If the user submits the checkout, it will go to thank you page with the timing of delivery Report.

### Tools and Technologies:

* **Technology** : Bootstrap, Java, Spring MVC, Spring Security, Spring JDBC, JSP, Maven.
* **Application Servicer**: Apache Tomcat Server.
* **Database** : SQL Server Database

### Installation:

1. Development Platform - Eclipse / IntelliJ Idea
   * [Download Eclipse](https://www.eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2).
   * [Download IntelliJ Idea](https://www.jetbrains.com/idea/download/#section=windows).
2. Server - Apache Tomcat Server

   * [Download Apache Server](https://tomcat.apache.org/download-70.cgi).

3. Build Tool - Maven

   * [Download Maven](https://maven.apache.org/download.cgi).

4. Database - SQL Server

   * [Download SQL Server Database](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).

5. Configuring tomcat with Eclipse (windows) - [Click Here](https://javatutorial.net/run-tomcat-from-eclipse).

6. Installation of maven in eclipse - [Click Here](https://stackoverflow.com/questions/8620127/maven-in-eclipse-step-by-step-installation).

7. Clone the repository and import it to eclipse.

8. Run your script duan2 in SQL Server Database.

9. Configure your databse configuration in **Application-context.xml**.

* Email properties:
        <!-- Email properties -->

             <bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
        <property name="host" value="smtp.gmail.com"/>
        <property name="port" value="25"/>
        <property name="username" value="YOUR MAIL"/>
        <property name="password" value="YOUR PASSWORD"/>
        <property name="javaMailProperties">
            <props>
                <prop key="mail.transport.protocol">smtp</prop>
                <prop key="mail.smtp.auth">true</prop>
                <prop key="mail.smtp.starttls.enable">true</prop>
                <prop key="mail.debug">true</prop>
            </props>
        </property>
    </bean>

10. Configure your databse configuration in **Application-context.xml**.

   * Database properties:


        <!-- database properties DataSource -->

            <bean id="dataSource"
              class="org.springframework.jdbc.datasource.DriverManagerDataSource">
              <property name="driverClassName" value=YOUR DB DRIVER CLASS NAME" />
              <property name="url" value="YOUR DB URL" />
              <property name="username" value="YOUR DB USERNAME" />
              <property name="password" value="YOUR DB PASSWORD" />
            </bean>

11. Run the server.

#### Somethings wrong!!

If you find that something's wrong with this package, you can let me know by raising an issue on the GitHub issue tracker, 
or take it as a task and 🧑‍💻 resolve it 💪 --> create a PullRequest 🛠.

#### Contribution

Contributors are most welcome.

### ScreenShots:

* Home Page:

![Link demo](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

* Contact Us:

![Facebook](https://www.facebook.com/profile.php?id=100010431690702)

