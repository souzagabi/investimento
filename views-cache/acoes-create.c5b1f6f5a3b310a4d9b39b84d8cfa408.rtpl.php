<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="box box-success title" style="background-color: #d5f8da;">
    <h4>
      Cadastro de Compra de Ações
    </h4>
  </div>
  <ol class="breadcrumb">
    <li><a href="/acoes"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="/acoes">Ação</a></li>
    <li class="active"><a href="/acoes/create">Cadastrar</a></li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div id="msg<?php if( $msg["state"] == 'SUCCESS' ){ ?>-success<?php }else{ ?>-danger<?php } ?>" 
        class="box box-<?php if( $msg["state"] == 'SUCCESS' ){ ?>-success<?php }else{ ?>danger<?php } ?>" 
        <?php if( $msg["state"] != 'SUCCESS' && $msg["state"] != 'ERROR' ){ ?>readonly hidden<?php } ?>>
    <div class="msg"><input type="text" class="form-control msg-<?php if( $msg["state"] == 'SUCCESS'  ){ ?>success alert-success<?php }else{ ?>danger alert-danger<?php } ?>" name="msg" value="<?php echo htmlspecialchars( $msg["msg"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" ></div>
  </div>
  <div class="row">
  	<div class="col-md-12">
  		<div class="box box-success">
        <div class="box-header with-border">
          <h3 class="box-title">Nova Ação</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        
        <form role="form" action="/acoes/create" method="post">
          <div class="box-body">
            <div class="col col-md-2">
              <div class="form-group">
                <label for="desperson">Empresa</label>
                <input type="text" class="form-control" name="desperson" id="desperson" onKeyUp="convertLowToUpper(desperson)" autofocus="autofocus">
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="sgcompany">Sigla</label>
                <input type="text" class="form-control" name="sgcompany" id="sgcompany" onKeyUp="convertLowToUpper(sgcompany)" required>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="descpfcnpj">CPF/CNPJ</label>
                <input type="text" class="form-control" name="descpfcnpj" id="descpfcnpj">
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="btipe">Tipo</label>
                <select class="form-control" name="btipe" id="btipe">
                  <option value="1" selected>Swing Trade</option>
                  <option value="2">Day Trade</option>
                </select>
              </div>
            </div>
          </div>
          <div class="box-body">
            <div class="col col-md-2">
              <div class="form-group">
                <label for="dtbuy">Data Compra</label>
                <input type="text" class="form-control" name="dtbuy" id="dtbuy" onChange="replaceSlash(dtbuy)" required>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="qtdebuy">Qtde</label>
                <input type="text" class="form-control" name="qtdebuy" id="qtdebuy" onChange="sumTotal(qtdebuy.value, prcbuy, tlbuy)" required>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="prcbuy">Valor Compra</label>
                <input type="text" class="form-control" name="prcbuy" id="prcbuy" onChange="sumTotal(qtdebuy.value, prcbuy, tlbuy);" required>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="tlbuy">Total Compra</label>
                <input type="text" class="form-control" id="tlbuy" name="tlbuy" readonly>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="bprcaverage">Valor Médio</label>
                <input type="text" class="form-control" id="bprcaverage" name="bprcaverage" readonly>
              </div>
            </div>
          </div>


          <div class="box-body">
            <div class="col col-md-2">
              <div class="form-group">
                <label for="dtsell">Data Venda</label>
                <input type="text" class="form-control" name="dtsell" id="dtsell" onChange="replaceSlash(dtsell)">
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="qtdesell">Qtde</label>
                <input type="text" class="form-control" name="qtdesell" id="qtdesell" onChange="sumTotal(qtdesell.value, prcsell, tlsell)">
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="prcsell">Valor Venda</label>
                <input type="text" class="form-control" name="prcsell" id="prcsell" onChange="sumTotal(qtdesell.value, prcsell, tlsell)">
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="tlsell">Total Venda</label>
                <input type="text" class="form-control" id="tlsell" name="tlsell" readonly>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="lucre">Lucro</label>
                <input type="text" class="form-control" id="lucre" name="lucre"  readonly>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="tax">Taxa</label>
                <input type="text" class="form-control" id="tax" name="tax" readonly>
              </div>
            </div>
          </div>
          <div class="box-body">
            <div class="col col-md-2">
              <div class="form-group">
                <label for="sprcaverage">Valor Médio</label>
                <input type="text" class="form-control" id="sprcaverage" name="sprcaverage" readonly>
              </div>
            </div>
            <div class="col col-md-2">
              <div class="form-group">
                <label for="stipe">Tipo</label>
                <select class="form-control" name="stipe" id="stipe">
                  <option value="1" selected>Swing Trade</option>
                  <option value="2" >Day Trade</option>
                </select>
              </div>
            </div>
            <div class="col col-md-2" hidden>
              <div class="form-group">
                <label for="stptransaction">Transação</label>
                <input type="text" class="form-control" id="stptransaction" name="stptransaction" value="V" readonly>
              </div>
            </div>
          </div>
          
          <!-- /.box-body -->
          <div class="box-footer">
            <input type="submit"name="compra" class="btn btn-success" value="Cadastrar Compra">
            <?php $counter1=-1;  if( isset($voltar) && ( is_array($voltar) || $voltar instanceof Traversable ) && sizeof($voltar) ) foreach( $voltar as $key1 => $value1 ){ $counter1++; ?>
            <a href="/<?php echo htmlspecialchars( $voltar["voltar"], ENT_COMPAT, 'UTF-8', FALSE ); ?>?limit=10" class="btn btn-warning">Voltar</a>
            <?php } ?>
          </div>
        </form>
      </div>
  	</div>
  </div>

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
