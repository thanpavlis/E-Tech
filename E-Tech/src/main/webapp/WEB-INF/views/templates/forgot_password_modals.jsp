<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--modal gia to email-->
<div id="emailModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 30px;margin-top: 30%;">
            <div class="modal-header">   
                <h1 class="text-center" style="margin: auto;font-size: 30px;font-weight: bold;">Forgot your password ?</h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">                
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <p>Please fill your email.</p>
                                <div class="panel-body">
                                    <fieldset>
                                        <div class="form-group">
                                            <input id="email-forget" class="form-control input-lg" placeholder="E-mail Address" type="email">
                                        </div>
                                        <input id="sendEmail" class="btn btn-lg btn-primary btn-block" value="Send Email" type="submit">
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="cancel-reset" class="btn" style="float: right;background-color: #c1c1c1;" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>    
            </div>
        </div>
    </div>
</div>
<!--modal gia ta passwords-->
<div id="passwordModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 30px;margin-top: 30%;">
            <div class="modal-header">   
                <h1 class="text-center" style="margin: auto;font-size: 30px;font-weight: bold;">Reset your password</h1>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <div class="panel-body">
                                    <fieldset>
                                        <div class="form-group">
                                            <div id="input_container">
                                                <input id="pass" class="form-control" placeholder="Enter your new password" type="password">                    
                                            </div>
                                            <span id="text-error-pass"></span>
                                        </div>
                                        <div class="form-group">
                                            <div id="input_container">
                                                <input style="margin-top: 20px;" id="confirm-pass" class="form-control" placeholder="Confirm your new password" type="password" disabled>                      
                                            </div>
                                            <span id="text-error-conf-pass"></span>
                                        </div>
                                        <input style="opacity: 0.2;" id="change-password-btn" class="btn btn-lg btn-primary btn-block" value="Change Password" type="submit" disabled>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="cancel-reset" class="btn" style="float: right;background-color: #c1c1c1;" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>    
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="./js/forgot_password.js"></script> 