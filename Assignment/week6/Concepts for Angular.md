### 1. SPA: 
Single page application is the web application that only loads one single html page.  
Unlike multiple-page application, there's only part of the single page gets updated with every click of mouse, instead of the entire page.  
When build the app, the application sends a single request to the server, and stores all received information in the cache. Only required part of the page is rewritten dynamically.

### 2. JIT vs AOT
For JIT:  
1. JIT(just in time) compiler complies application in the browser at runtime, which means the code gets compiled when needed.  
2. Compile each file seperately, do not need to build the whole project again after changing code.
3. Most compiling is done on the browser side, so it will take less compiling time.
4. Catch template binding error at display time
5. Usage: 
```
ng build
ng serve
```

For AOT:
1. AOT(ahead of time) compiler complies application at build time on the server, In simple words, when build angular application, the AOT compiler converts code during the build time before browser downloads and runs that code.  
2. While build the project, the compilation only happens once. 
3. It provides quicker component rendering, because the browser does not need to compile the code in run time.
4. Detects template error earlier. It detects and reports template binding errors during the build steps before users can see them.
5. Usage: 
```
ng build --aot
ng serve --aot 
```
