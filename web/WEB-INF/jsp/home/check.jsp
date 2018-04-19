<%-- 
    Document   : check
    Created on : Feb 20, 2017, 10:25:42 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    function inserNote(id) {
        var note = document.getElementById('note').value;
        if (note.length > 0) {
            $.post('Check', {'action': 'insert', 'id': id, 'note': note}, function (html) {
                $(".list").html(html);
            });
        }
        $('#note').val("");
    }

    function deleteNote(id) {
        $.post('Check', {'action': 'delete', 'id': id}, function (html) {
            $(".list").html(html);
        });
    }

    function checkedNote(id) {
        $.post('Check', {'action': 'checked', 'id': id}, function (html) {
        });
    }

    window.onload = function List() {
        $.post('Check', {'action': 'list'}, function (html) {
            $(".list").html(html);
        });

    };
</script>
<style>

</style>
<div class="col-md-5">
    <div class="card ">
        <div class="header">
            <h4 class="title">Tasks</h4>
            <p class="category">Backend development</p>
        </div>
        <div class="content">
            <div class="table-full-width">
                <table class="table">
                    
                    <tbody class="list">

                        <!--                                                <tr>
                                                                            <td>
                                                                                <label class="checkbox">
                                                                                    <input type="checkbox" value="12" id="check" data-toggle="checkbox" checked onchange="checkedNote(4)">
                                                
                                                                                </label>
                                                                            </td>
                                                                            <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                                            <td class="td-actions text-right">
                                                                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                                                                                    <i class="fa fa-edit"></i>
                                                                                                                </button>
                                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs" onclick="deleteNote(3)" >
                                                                                    <i class="fa fa-times"></i>
                                                                                </button>
                                                                            </td>
                                                                        </tr>-->


                    </tbody>
                </table>
            </div>
            <form>
                <div class="input-group">
                    <textarea style="float: left; width: 270px; margin-right: 10px; border: #ccccff solid 1px; border-radius: 2px;" id="note" required=""></textarea>
                    <button type="button" class="btn btn-info" onclick="inserNote(${sessionScope.id})">submit</button>
                </div>
            </form>
        </div>
    </div>
</div>


