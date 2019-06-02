<#import "parts/common.ftl" as c>
<@c.page>
    <h3>Редактирование страницы</h3>
    <form action="/constructor/course/${course.id}/topic/${topic.id}/page/${page.id}/preview" method="post"
          enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <div class="form-group">
            <label for="priority">Номер страницы</label>
            <input type="number" class="form-control" id="priority" name="priority" value="${page.priority}">
        </div>
        <div class="form-group">
            <label for="title">Заголовок страницы</label>
            <input type="text" class="form-control" id="title" name="name" value="${page.name}">
        </div>
        <div class="form-group">
            <label for="content">Содержимое страницы</label>
            <textarea class="form-control" id="content" aria-describedby="content-help" rows="13"
                      name="content"><#if page.path??>${content}</#if></textarea>
            <small id="content-help" class="form-text text-muted">
                Разрешено использовать HTML теги и элементы <a
                        href="https://getbootstrap.com/docs/4.3/content/typography/">Bootstrap</a>
            </small>
        </div>
        <div class="form-group">
            <label for="content-file">Или можно загрузить содержимое из текстового файла</label>
            <input type="file" class="form-control-file" id="content-file" aria-describedby="content-file-help"
                   accept=".txt,.html" name="contentFile">
            <small id="content-file-help" class="form-text text-muted">
                Если загружен файл, то содержимое страницы будет браться только из файла
            </small>
        </div>
        <button type="submit" class="btn btn-primary">Предпросмотр</button>
    </form>
</@c.page>