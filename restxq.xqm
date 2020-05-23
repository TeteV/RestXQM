module namespace page = 'http://pepillo.com';

declare
  %rest:path('/home')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:juego()
as element(html) {
  <html>
    <head>
      <title>Table Games</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="static/styles.css"/>
    </head>
    <body>

    <div class="container mt-4"> <!--Este es el container general-->

    <div class="row">

      <div class="col-6">
        <h5> Consultar Juego</h5>

        <form class="form-inline" action="/juego" method="POST">

          <div class="form-inline">
            <label for="idJuego">ID Juego a consultar: &#160;</label>
            <input class="form-control form-control-sm col-3" type="text" name="idJuego"/>
          </div>

          <button class="btn btn-info btn-sm" type="submit">Consultar</button>

        </form>


      </div>



      <div class="col-6">
        <h5>Borrar Juego</h5>
          <form class="form-inline" action="/delJuego" method="POST">

            <div class="form-inline">
            <label for="idJuego">ID a borrar: &#160;</label>
            <input class="form-control form-control-sm col-3" type="text" name="idJuego"/>
            </div>

            <button class="btn btn-danger btn-sm" type="submit">Borrar</button>

          </form>
      </div>

    </div>


        <p class="linea mt-5"></p>  <!--Cambio de linea-->

        
  <div class="row mt-5">


    <div class="col-6">
      <h5> Cambiar Juego</h5>
      <form class="form-group" action="/modJuego" method="POST">

          <div class="form-group">
          <label for="idJuego">ID juego a cambiar:&#160;</label>
          <input type="text" class="form-control form-control-sm col-2" name="idJuego"/>
          </div>

          <div class="form-group">
          <label for="nombre">Nombre nuevo del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="nombre"/>
          </div>

          <div class="form-group">
          <label for="duracion">Duracion nueva del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="duracion"/>
          </div>

          <div class="form-group">
          <label for="dificultad">Dificultad nueva del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="dificultad"/>
          </div>

          <div class="form-group">
          <label for="nJugadores">Nº de Jugadores nuevo del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="nJugadores"/>
          </div>

          <div class="form-group">
          <label for="tipo">Tipo nuevo juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="tipo"/>
          </div>

          <div class="form-group">
          <label for="fabricante">Fabricante nuevo del juego : &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="fabricante"/>
          </div>

          <div class="form-group">
          <label for="edadRec">Edad recomendada nueva del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="edadRec"/>
          </div>

         <button class="btn btn-primary btn-sm" type="submit">Cambiar</button>
         
      </form>

  </div> <!--Este es el cierra div del col-->



  <div class="col-6">
     <h5>Añadir Juego</h5>

        <form class="form-group" action="/addJuego" method="POST">

          <div class="form-group">
          <label for="idJuego">ID juego:&#160;</label>
          <input type="text" class="form-control form-control-sm col-2" name="idJuego"/>
          </div>

          <div class="form-group">
          <label for="nombre">Nombre del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="nombre"/>
          </div>

          <div class="form-group">
          <label for="duracion">Duracion del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="duracion"/>
          </div>

          <div class="form-group">
          <label for="dificultad">Dificultad juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="dificultad"/>
          </div>

          <div class="form-group">
          <label for="nJugadores">Numero de Jugadores del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="nJugadores"/>
          </div>

          <div class="form-group">
          <label for="tipo">Tipo del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="tipo"/>
          </div>

          <div class="form-group">
          <label for="fabricante">Fabricante del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="fabricante"/>
          </div>

          <div class="form-group">
          <label for="edadRec">Edad recomendada del juego: &#160;</label>
          <input type="text" class="form-control form-control-sm col-6" name="edadRec"/>
          </div>

          <button class="btn btn-success btn-sm" type="submit">Añadir</button>

        </form> 

  </div> <!--Este es el cierra div del col-->

</div> <!--Este es el cierra div del row-->

     

     </div> <!-- Este es el div que cierra en container-->
    </body>
  </html>
};

declare 
  %rest:POST
  %rest:path('/addJuego')
  %rest:form-param("idJuego", "{$idJuego}","(no id")
  %rest:form-param("nombre", "{$nombre}","(no nombre")
  %rest:form-param("duracion", "{$duracion}","(no duracion")
  %rest:form-param("dificultad", "{$dificultad}","(no dificultad")
  %rest:form-param("nJugadores", "{$nJugadores}","(no jugadores")
  %rest:form-param("tipo", "{$tipo}","(no tipo")
  %rest:form-param("fabricante", "{$fabricante}","(no frabricante")
  %rest:form-param("edadRec", "{$edadRec}","(no edad")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
    updating function page:addjuego (
      $idJuego as xs:string,
      $nombre as xs:string,
      $duracion as xs:string,
      $dificultad as xs:string,
      $nJugadores as xs:string,
      $tipo as xs:string,
      $fabricante as xs:string,
      $edadRec as xs:string
      )
 {
   update:output(web:redirect('/home')),
      for $juegos in doc("juegos")//juegos
      return insert node
    <juego>
     <idJuego>{$idJuego}</idJuego>
     <nombre>{$nombre}</nombre>
     <nJugadores>{$nJugadores}</nJugadores>
     <tipo>{$tipo}</tipo>
     <duracion>{$duracion}</duracion>
     <dificultad>{$dificultad}</dificultad>
     <fabricante>{$fabricante}</fabricante>
     <edadRec>{$edadRec}</edadRec>
   </juego>
      as first into $juegos
};


declare 
  %rest:path('/modJuego')
  %rest:POST
  %rest:form-param("idJuego", "{$idJuego}","(no id")
  %rest:form-param("nombre", "{$nombre}","(no nombre")
  %rest:form-param("duracion", "{$duracion}","(no duracion")
  %rest:form-param("dificultad", "{$dificultad}","(no dificultad")
  %rest:form-param("nJugadores", "{$nJugadores}","(no jugadores")
  %rest:form-param("tipo", "{$tipo}","(no tipo")
  %rest:form-param("fabricante", "{$fabricante}","(no frabricante")
  %rest:form-param("edadRec", "{$edadRec}","(no edad")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
    updating function page:modjuego (
      $idJuego as xs:string,
      $nombre as xs:string,
      $duracion as xs:string,
      $dificultad as xs:string,
      $nJugadores as xs:string,
      $tipo as xs:string,
      $fabricante as xs:string,
      $edadRec as xs:string)
 {
   update:output(web:redirect('/home')),
      for $juego in doc("juegos")//juego
      where $juego/idJuego = $idJuego
      return
        replace node $juego with
          <juego>
     <idJuego>{$idJuego}</idJuego>
     <nombre>{$nombre}</nombre>
     <nJugadores>{$nJugadores}</nJugadores>
     <tipo>{$tipo}</tipo>
     <duracion>{$duracion}</duracion>
     <dificultad>{$dificultad}</dificultad>
     <fabricante>{$fabricante}</fabricante>
     <edadRec>{$edadRec}</edadRec>
   </juego>

};


declare
  %rest:path('/juego')
  %rest:POST
  %rest:form-param("idJuego", "{$idJuego}")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:infojuego (
 $idJuego as xs:string)
 as element(html) {
  <html>
    <head>
      <title>Consult</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="static/styles.css"/>
    </head>
    <body>
     {
        for $juego in doc("juegos")//juego
       where $juego/idJuego/text() = $idJuego
       return
       <div class="container">
       <br></br>
        <div class="row">
        <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Duracion</th>
        <th>Dificultad</th>
        <th>Nº Jugadores</th>
        <th>Tipo</th>
        <th>Fabricante</th>
        <th>Edad Min.</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>{$juego/idJuego/text()}</td>
        <td>{$juego/nombre/text()}</td>
        <td>{$juego/duracion/text()}</td>
        <td>{$juego/dificultad/text()}</td>
        <td>{$juego/nJugadores/text()}</td>
        <td>{$juego/tipo/text()}</td>
        <td>{$juego/fabricante/text()}</td>
        <td>{$juego/edadRec/text()}</td>
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
  %rest:path('/delJuego')
  %rest:POST
  %rest:form-param("idJuego", "{$idJuego}","(no id")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:deljuego(
 $idJuego as xs:string) {
  update:output(web:redirect('/home')),
  for $juego in doc("juegos")//juego
  where $juego/idJuego/text() = $idJuego
  return delete node $juego
};
