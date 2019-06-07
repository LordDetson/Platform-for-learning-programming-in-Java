<#import "parts/common.ftl" as c>
<@c.page>
    <h3>Редактирование профиля</h3>
    <form action="/user/${user.id}/edit" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Наименование профиля:</label>
            <div class="col-sm-4">
                <input class="form-control" type="text" name="username" placeholder="Username" value="${user.username}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-4">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-4">
                <input class="form-control" type="email" name="email" placeholder="some@some.com"
                       value="${user.email!''}"/>
            </div>
        </div>
        <button class="btn btn-primary mb-2" type="submit">Сохранить</button>
    </form>
</@c.page>