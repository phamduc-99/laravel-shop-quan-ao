@extends('backend.master.master')

@section('title', 'Đơn hàng đã xử lý')

@section('content')

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use>
						</svg></a></li>
				<li class="active">Icons</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Quản lý danh mục</h1>
			</div>
		</div>
		<!--/.row-->


		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
						 <form method="POST" action="{{route('category.update',['id'=> $category['id']])}}">
								@csrf
							<div class="col-md-5">

								<div class="form-group">
									<label for="">Danh mục cha:</label>
									<select class="form-control" name="parent" >
										<option value="0">----ROOT----</option>
									    {!! getCategories($categories, 0, "", $category['parent'] ) !!}
									</select>
								</div>
								<div class="form-group">
									<label for="">Tên Danh mục</label>
									<input type="text" class="form-control" name="name"  placeholder="Tên danh mục mới" value="{{$category->name}}">
									{!! showErrors($errors,'name') !!}
								</div>
								<button type="submit" class="btn btn-primary">Sửa danh mục</button>
							</div>
						</form>
							<div class="col-md-7">
								@if(session('success'))
									<div class="alert bg-success" role="alert">
										<svg class="glyph stroked checkmark">
											<use xlink:href="#stroked-checkmark"></use>
										</svg> {{session('success')}} <a href="#" class="pull-right"><span class="glyphicon glyphicon-remove"></span></a>
									</div>
								@endif
								<h3 style="margin: 0;"><strong>Phân cấp Menu</strong></h3>
								<div class="vertical-menu">
									<div class="item-menu active">Danh mục </div>
									{!! listCategories($categories,0,"") !!}
								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
			<!--/.col-->


		</div>
		<!--/.row-->
	</div>
	<!--/.main-->

@endsection
@section('script')
	@parent
	<script>
		$('#calendar').datepicker({});

		! function ($) {
			$(document).on("click", "ul.nav li.parent > a > span.icon", function () {
				$(this).find('em:first').toggleClass("glyphicon-minus");
			});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
			if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
			if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>
@endsection