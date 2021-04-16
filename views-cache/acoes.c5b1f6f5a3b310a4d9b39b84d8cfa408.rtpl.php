<?php if(!class_exists('Rain\Tpl')){exit;}?><div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Lista de Ações
    </h1>
    <ol class="breadcrumb">
      <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active"><a href="/acoes">Ações</a></li>
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
            <tr>
              <th>Empresa</th>
              <th>Sigla</th>
              <th>Qtde Estoque</th>
              <th>Valor Médio</th>
              <th>Valor Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $counter1=-1;  if( isset($acoes) && ( is_array($acoes) || $acoes instanceof Traversable ) && sizeof($acoes) ) foreach( $acoes as $key1 => $value1 ){ $counter1++; ?>
            <tr>
              <th><?php echo htmlspecialchars( $value1["desperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th>
              <th><?php echo htmlspecialchars( $value1["sgecompany"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th>
              <td><?php echo htmlspecialchars( $value1["qtdeestoque"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
              <td><?php echo htmlspecialchars( $value1["prcaverage"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
              <td><?php echo htmlspecialchars( $value1["prcaverage"] * $value1["qtdeestoque"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>