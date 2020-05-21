module namespace page = 'http://pepillo.com';

declare
  %rest:path('/home')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:phone()
as element(html) {
  <html>
    <head>
      <title>prueba</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="static/styles.css"/>
    </head>
    <body>
    <br></br>
    <div class="container">

    <div>
    <h5> Consultar Telefono</h5>
        <form class="form-inline" action="/phone" method="POST">
        <div class="form-inline">
          <label for="phoneid">ID Telefono a consultar: &#160;</label>
          <input class="form-control form-control-sm col-2" type="text" name="phoneid"/>
        </div>
          <button class="btn btn-info btn-sm" type="submit">Consultar</button>
        </form>
        <p class="mt-5"></p>
<p class="linea"></p>
        </div>
<br></br>

        
      <div>
      <h5> Cambiar Telefono</h5>
        <form class="form-inline" action="/modPhone" method="POST">

        <div class="form-inline">
        <label for="phoneid">ID Movil a cambiar:&#160;</label>
          <input type="text" class="form-control form-control-sm col-2" name="phoneid"/>
          </div>

          <div class="form-inline">
          <label for="brand">Marca Movil a cambiar: &#160;</label>
          <input type="text" class="form-control form-control-sm col-4" name="brand"/>
          </div>

          <div class="form-inline">
          <label for="model">Modelo Movil a cambiar: &#160;</label>
          <input type="text" class="form-control form-control-sm col-4" name="model"/>
          </div>
         <button class="btn btn-primary btn-sm" type="submit">Cambiar</button>
        </form>
        <p class="mt-5"></p>
        <p class="linea"></p>
     </div>
<br></br>
     <h5>Añadir telefono</h5>
      <div>

        <form class="form-inline" action="/addPhone" method="POST">

        <div class="form-inline">
         <label for="phoneid">ID: &#160;</label>
          <input type="text" class="form-control form-control-sm col-2" name="phoneid"/>
          </div>

          <div class="form-inline">
           <label for="brand">Marca: &#160;</label>
          <input type="text" class="form-control form-control-sm col-5" name="brand"/>
          </div>

          <div class="form-inline">
           <label for="model">Modelo: &#160;</label>
          <input type="text" class="form-control form-control-sm col-5" name="model"/>
          </div>

          <button class="btn btn-success btn-sm" type="submit">Añadir</button>
        </form>
        <p class="mt-5"></p>
<p class="linea"></p>
     </div>

     <br></br>
     <h5>Borrar telefono</h5>
      <div>
         <form class="form-inline" action="/delPhone" method="POST">
          <div class="form-inline">
           <label for="phoneid">ID a borrar: &#160;</label>
          <input type="text" class="form-control form-control-sm col-5" name="phoneid"/>
          </div>
          <button class="btn btn-danger btn-sm" type="submit">Borrar</button>
        </form>
        <p class="mt-5"></p>
<p class="linea"></p>
     </div>
     </div>
    </body>
  </html>
};

declare 
  %rest:POST
  %rest:path('/addPhone')
  %rest:form-param("phoneid", "{$phoneid}","(no id")
  %rest:form-param("model", "{$model}","(no model")
  %rest:form-param("brand", "{$brand}","(no brand")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
    updating function page:addphone (
      $phoneid as xs:string,
      $model as xs:string,
      $brand as xs:string)
 {
   update:output(web:redirect('/home')),
      for $phones in doc("phones")//phones
      return insert node
          <phone>
            <phoneid>{$phoneid}</phoneid>
            <model>{$model}</model>
            <brand>{$brand}</brand>
          </phone>
      as first into $phones
};


declare 
  %rest:path('/modPhone')
  %rest:POST
  %rest:form-param("phoneid", "{$phoneid}","(no id")
  %rest:form-param("model", "{$model}","(no model")
  %rest:form-param("brand", "{$brand}","(no brand")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
    updating function page:modphone (
      $phoneid as xs:string,
      $model as xs:string,
      $brand as xs:string)
 {
   update:output(web:redirect('/home')),
      for $phone in doc("phones")//phone
      where $phone/phoneid = $phoneid
      return
        replace node $phone with
          <phone>
            <phoneid>{$phoneid}</phoneid>
            <model>{$model}</model>
            <brand>{$brand}</brand>
          </phone>

};


declare
  %rest:path('/phone')
  %rest:POST
  %rest:form-param("phoneid", "{$phoneid}")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:infophone(
 $phoneid as xs:string)
 as element(html) {
  <html>
    <head>
      <title>prueba</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="static/styles.css"/>
    </head>
    <body>
     {
        for $phone in doc("phones")//phone
       where $phone/phoneid/text() = $phoneid
       return
       <div class="container">
       <br></br>
        <div class="row">
        <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Marca</th>
        <th>Modelo</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>{$phone/phoneid/text()}</td>
        <td>{$phone/brand/text()}</td>
        <td>{$phone/model/text()}</td>
      </tr>

    </tbody>
  </table>
        </div>
      </div>
      }
    
    <div class="container">
    <div class="row">
      <form action="/home">
    <input class="btn btn-primary btn-sm" type="submit" value="Home" />
</form>
</div>
</div>

    </body>
  </html>
};



declare
  %rest:path('/delPhone')
  %rest:POST
  %rest:form-param("phoneid", "{$phoneid}","(no id")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:delphone(
 $phoneid as xs:string) {
  update:output(web:redirect('/home')),
  for $phone in doc("phones")//phone
  where $phone/phoneid/text() = $phoneid
  return delete node $phone
};
