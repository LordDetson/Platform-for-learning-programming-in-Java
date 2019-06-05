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
            <label for="content">Содержимое страницы
                <button type="button" class="badge badge-pill badge-info" data-toggle="modal" data-target="#contentHelp">
                    Получить подсказку
                </button>
            </label>
            <div class="modal fade" id="contentHelp" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalScrollableTitle">Рекомендации по добавлению содержимого страницы</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert alert-danger mt-2" role="alert">
                                <h4 class="alert-heading">Структура содержимого</h4>
                                <p>Запрещено использовать следующую структуру содержимого страницы:</p>
                                <hr>
                                <pre class="html4strict" style="font-family:monospace;"><span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">html</span>&gt;</span>
    <span style="color: #009900;">&lt;header&gt;&lt;<span style="color: #66cc66;">/</span>header&gt;</span>
    <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">body</span>&gt;</span>
        Содержимое...
    <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">body</span>&gt;</span>
<span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">html</span>&gt;</span></pre>
                                <hr>
                                <p>Так как все содержимое страницы будет добавлено в эту структуру.</p>
                            </div>
                            <div class="alert alert-warning mt-2" role="alert">
                                <h4 class="alert-heading">Подсветка синтаксиса</h4>
                                <p>Подсветку ситакциса вставляемого кода можно получить на <a href="http://highlight.hohli.com/index.php" class="alert-link">этом сайте</a></p>
                                <p>Полученную подсветку ситакциса кода советуеться добавить в блок для центрирования и прокрутки:</p>
                                <hr>
                                <pre class="html4strict" style="font-family:monospace;"><span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">class</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;container&quot;</span>&gt;</span>
    <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">class</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;row&quot;</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">class</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;col&quot;</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">class</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;col&quot;</span>&gt;</span>
            <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">style</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;height:500px; width:800px; overflow:scroll;&quot;</span>&gt;</span>
                Содержимое кода...
            <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #000000; font-weight: bold;">div</span> <span style="color: #000066;">class</span><span style="color: #66cc66;">=</span><span style="color: #ff0000;">&quot;col&quot;</span>&gt;</span>
        <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span>
    <span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span>
<span style="color: #009900;">&lt;<span style="color: #66cc66;">/</span><span style="color: #000000; font-weight: bold;">div</span>&gt;</span></pre>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть подсказку</button>
                        </div>
                    </div>
                </div>
            </div>

            <textarea class="form-control" id="content" aria-describedby="content-help" rows="13"
                      name="content"><#if page.path??>${content}</#if></textarea>
            <small id="content-help" class="form-text text-muted">
                Разрешено использовать HTML теги и элементы <a class="badge badge-info"
                                                               href="https://getbootstrap.com/docs/4.3/content/typography/">Bootstrap</a>
                <a href="http://highlight.hohli.com/index.php" class="badge badge-info">Подсветка синтаксиса</a> на
                странице
            </small>
            <hr>
            <div class="form-group">
                <label for="content-file">Или можно загрузить содержимое из файла (*.txt, *.html)</label>
                <input type="file" class="form-control-file" id="content-file" aria-describedby="content-file-help"
                       accept=".txt,.html" name="contentFile">
                <small id="content-file-help" class="form-text text-muted">
                    Если загружен файл, то содержимое страницы будет браться только из файла
                </small>
            </div>
            <button type="submit" class="btn btn-primary">Предпросмотр</button>
    </form>
        </div>
</@c.page>