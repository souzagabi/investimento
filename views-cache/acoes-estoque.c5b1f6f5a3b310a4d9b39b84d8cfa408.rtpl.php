<?php if(!class_exists('Rain\Tpl')){exit;}?><div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Lista de Ações
    </h1>
    <ol class="breadcrumb">
      <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active"><a href="/acoes-estoque">Ações Estoque</a></li>
    </ol>
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="box box-primary">
      <div class="col form-control top">
        <div class="row">
          <div class="col col-md-5">
            <form action="/acoes/create" method="get">
              <input type="submit" name="compra" class="btn btn-success" value="Cadastrar Compra">
              <input type="submit" name="venda" class="btn btn-success" value="Cadastrar Venda">
              <input type="text" name="acoes" value="acoes" hidden>
            </form>
          </div>
          <form action="/acoes-estoque" method="get">
            <div class="col col-md-2"><label for="sgcompany">Sigla</label><input type="text" name="sgcompany" id="sgcompany" class="form-control"></div>
            <div class="col col-md-2"><label for="dtbuy">Data Inicio</label><input type="text" name="dtbuy" id="dtbuy" class="form-control" onChange="replaceSlash(dtbuy)"></div>
            <div class="col col-md-2"><label for="dtsell">Data Fim</label><input type="text" name="dtsell" id="dtsell" class="form-control" onChange="replaceSlash(dtsell)"></div>
            <input type="submit" name="search" class="btn btn-primary" value="Search">
          </form>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <div class="box-body no-padding">
        <table class="table table-striped">
          <thead class="thead-dark">
            <tr class="com-estoque"><th colspan="6">Ações com Estoque até a data filtrada</th></tr>
            <tr>
              <th>Empresa</th>
              <th>Sigla</th>
              <th>CNPJ</th>
              <th>Qtde Compra</th>
              <th>Qtde Venda</th>
              <th>Estoque Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $counter1=-1;  if( isset($acoes) && ( is_array($acoes) || $acoes instanceof Traversable ) && sizeof($acoes) ) foreach( $acoes as $key1 => $value1 ){ $counter1++; ?>
              <?php if( $value1["finalTotal"] > 0 ){ ?> <tr> 
                 <th><?php echo htmlspecialchars( $value1["desperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </th> 
                 <th><?php echo htmlspecialchars( $value1["sgcompany"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </th> 
                 <th><?php echo htmlspecialchars( $value1["descpfcnpj"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th> 
                 <td><?php echo htmlspecialchars( $value1["buyTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?>  </td> 
                 <td><?php echo htmlspecialchars( $value1["sellTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </td> 
                 <td><?php echo htmlspecialchars( $value1["finalTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td> 
               </tr> <?php } ?>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
    <div class="box box-primary">
      <div class="box-body no-padding">
        <table class="table table-striped">
          <thead class="thead-dark">
            <tr class="sem-estoque"><th colspan="6">Ações sem Estoque até a data filtrada</th></tr>
            <tr>
              <th>Empresa</th>
              <th>Sigla</th>
              <th>CNPJ</th>
              <th>Qtde Compra</th>
              <th>Qtde Venda</th>
              <th>Estoque Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $counter1=-1;  if( isset($acoes) && ( is_array($acoes) || $acoes instanceof Traversable ) && sizeof($acoes) ) foreach( $acoes as $key1 => $value1 ){ $counter1++; ?>
              <?php if( $value1["finalTotal"] == 0 ){ ?> <tr> 
                 <th><?php echo htmlspecialchars( $value1["desperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </th> 
                 <th><?php echo htmlspecialchars( $value1["sgcompany"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </th> 
                 <th><?php echo htmlspecialchars( $value1["descpfcnpj"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th> 
                 <td><?php echo htmlspecialchars( $value1["buyTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?>  </td> 
                 <td><?php echo htmlspecialchars( $value1["sellTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </td> 
                 <td><?php echo htmlspecialchars( $value1["finalTotal"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td> 
               </tr> <?php } ?>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>