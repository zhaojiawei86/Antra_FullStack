1. right click apiplayer project => publish => publish to azure => for the first time, click new
<img width="699" alt="image" src="https://user-images.githubusercontent.com/59852184/222787481-719535cf-a761-42af-9626-98efd3368db3.png">

2. add a new resource group here, it will create a new one in your account automatically.
<img width="699" alt="image" src="https://user-images.githubusercontent.com/59852184/222788527-2958d3f9-cf7b-45b1-9820-84a8a44f97a2.png">

3. Next => do not deploy a docker container => create

4. after published => back to your azure account => search resource groups => find your resource group and app service
![image](https://user-images.githubusercontent.com/59852184/222789839-450cbbd2-a05d-41d5-a77c-9aabe1aa214f.png)

5. get into app service => configuration => add new application setting
![image](https://user-images.githubusercontent.com/59852184/222790063-de2abed5-fa4c-4ea7-ae0a-53b074c7299c.png)

6. Name: ASPNETCORE_ENVIRONMENT  
Value: Development  
click new
![image](https://user-images.githubusercontent.com/59852184/222790346-29255490-e266-4825-91fe-614342910a25.png)

7. remember to save new setting   
![image](https://user-images.githubusercontent.com/59852184/222790702-69d0156c-b07a-4420-a14f-b17fba06e6ef.png)

8. jump to your default domain, and you will find this
![image](https://user-images.githubusercontent.com/59852184/222790964-d2c77b1d-db30-4a9a-bb6a-db5a3d4e4988.png)

9. add your controller url or swagger index at the end of the domain.
For example: https://hrminterviewapilayer.azurewebsites.net/swagger/index.html  
You will find your project has been published successully.
