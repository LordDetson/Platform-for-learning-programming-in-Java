<#include "security.ftl">

<#macro login path isRegitrationForm>
    <form action="${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя:</label>
            <div class="col-sm-4">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}" type="text"
                       name="username" placeholder="Имя пользователя" value="<#if user??>${user.username}</#if>"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegitrationForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-4">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}" type="email"
                           name="email" placeholder="some@some.com" value="<#if user??>${user.email}</#if>"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-4">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password"
                       name="password" placeholder="Пароль"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegitrationForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Повторите пароль:</label>
                <div class="col-sm-4">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}" type="password"
                           name="password2" placeholder="Повторите пароль"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="col-sm-4 mb-3">
                <div class="g-recaptcha" data-sitekey="6LdRp6MUAAAAAB_WIUApcC71Pq2ymjCGJdvF4g8T"></div>
            </div>
            <#if captchaError??>
                <div class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </#if>
        <button class="btn btn-primary mb-2 mr-4" type="submit">
            <#if isRegitrationForm>
                Зарегестрироваться
            <#else>
                Войти
            </#if>
        </button>
        <#if !isRegitrationForm>
            <a href="/registration">Регестрация</a>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn-primary mb-2" type="submit"><#if user??>Выйти<#else>Войти</#if></button>
    </form>
</#macro>