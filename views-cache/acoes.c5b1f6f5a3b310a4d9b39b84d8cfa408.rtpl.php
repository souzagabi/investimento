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
    <form action="/acoes/create" method="get">
      <div class="box box-primary">
        <div class="col form-control">
          <input type="submit" name="compra" class="btn btn-success" value="Cadastrar Compra">
          <input type="submit" name="venda" class="btn btn-success" value="Cadastrar Venda">
          <input type="text" name="acoes" value="acoes" hidden>
          <!-- <a href="/acoes/create" name="teste" class="btn btn-success">Cadastrar Compra</a> -->
          <!-- <a href="/acoes/vcreate" class="btn btn-success">Cadastrar Venda</a> -->
        </div>
      </div>
    </form>
    <div class="box box-primary">
      <div class="box-body no-padding">
    
        <table class="table table-striped">
          <thead class="thead-dark">
            <tr>
              <th>Empresa</th>
              <th>Qtde Estoque</th>
              <th>Valor Médio</th>
              <th>Valor Total</th>
              <th>Ação</th>
            </tr>
          </thead>
          <tbody>
            <?php $counter1=-1;  if( isset($acoes) && ( is_array($acoes) || $acoes instanceof Traversable ) && sizeof($acoes) ) foreach( $acoes as $key1 => $value1 ){ $counter1++; ?>
            <tr>
              <th><?php echo htmlspecialchars( $value1["sgecompany"], ENT_COMPAT, 'UTF-8', FALSE ); ?></th>
              <td><?php echo htmlspecialchars( $value1["qtdeestoque"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
              <td><?php echo htmlspecialchars( $value1["prcaverage"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
              <td><?php echo htmlspecialchars( $value1["prcaverage"] * $value1["qtdeestoque"], ENT_COMPAT, 'UTF-8', FALSE ); ?></td>
              <td>
                <a href="/acoes/<?php echo htmlspecialchars( $value1["idperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i></a>
                <a href="/acoes/<?php echo htmlspecialchars( $value1["idperson"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/delete1" onclick="return confirm('Deseja realmente excluir este registro?')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
              </td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>