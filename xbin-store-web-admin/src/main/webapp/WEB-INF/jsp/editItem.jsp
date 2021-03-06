<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function () {
        initFileInput("edititem${random}", "/pic/upload.action", 1);

        $(".js-data-example-ajax").select2({
            ajax: {
                url: "https://api.github.com/search/repositories",
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function (data, params) {
                    // parse the results into the format expected by Select2
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data, except to indicate that infinite
                    // scrolling can be used
                    params.page = params.page || 1;

                    return {
                        results: data.items,
                        pagination: {
                            more: (params.page * 30) < data.total_count
                        }
                    };
                },
                cache: true
            },
            escapeMarkup: function (markup) {
                return markup;
            }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatRepo, // omitted for brevity, see the source of this page
            templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
        });
    });

</script>

<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Logo修改</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>类 目:</label>

                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-laptop"></i>
                        </div>
                        <select class="js-data-example-ajax">
                            <option value="3620194" selected="selected">select2/select2</option>
                        </select>
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="form-group">
                    <label>网 址:</label>

                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-laptop"></i>
                        </div>
                        <input type="text" class="form-control" value="http://">
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="form-group">
                    <label>图 片:</label>

                    <div class="input-group">
                        <input id="edititem${random}" name="uploadFile" type="file" multiple class="file-loading"
                               accept="image/*">
                        <input type="hidden" name="fileurl" id="fileurl1" value="">
                    </div>
                    <!-- /.input group -->
                </div>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
    <!-- /.form group -->

</div>
<!-- /.box-body -->
</div>

