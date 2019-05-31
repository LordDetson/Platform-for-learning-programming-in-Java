<#import "parts/common.ftl" as c>
<@c.page>
    <h1 class="mb-4">Создание курса</h1>
    <form action="/constructor/course" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <div class="col">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Название курса</div>
                    </div>
                    <input type="text" class="form-control" name="name">
                </div>
            </div>
            <div class="file-field">
                <div class="btn btn-primary btn-sm">
                    <span>Картинка</span>
                    <input type="file" name="imgFile" accept="image/*">
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Название курса</div>
                    </div>
                    <textarea rows="4" class="form-control" name="description"></textarea>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-2">
                <button type="submit" class="btn btn-primary">Создать курс</button>
            </div>
            <div class="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="activeCourse" name="active">
                    <label class="form-check-label" for="activeCourse">
                        Активировать курс
                    </label>
                </div>
            </div>
        </div>
    </form>
</@c.page>