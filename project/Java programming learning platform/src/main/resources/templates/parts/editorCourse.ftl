<#macro editorCourse isCreate>
    <h1 class="mb-4"><#if isCreate>Создание курса<#else>Редактирование курса</#if></h1>
    <#if !isCreate>
        <a class="btn btn-primary" data-toggle="collapse" href="#editCourse" role="button" aria-expanded="false"
           aria-controls="editCourse">
            Другое
        </a>
    </#if>
    <div class="collapse <#if isCreate>show</#if>" id="editCourse">
        <div class="form-group mt-3">
            <form action="<#if isCreate>/constructor/course<#else>/constructor/course/${course.id}</#if>" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group row">
                    <div class="col">
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">Название курса</div>
                            </div>
                            <input type="text" class="form-control" name="name"
                                   value="<#if course??>${course.name}</#if>">
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
                                <div class="input-group-text">Описание</div>
                            </div>
                            <textarea rows="4" class="form-control"
                                      name="description"><#if course??>${course.description}</#if></textarea>
                        </div>
                    </div>
                </div>
                <#if !isCreate && course.imgName??>
                    <div class="form-group row">
                        <div class="text-center">
                            <img class="rounded" src="/img/${course.imgName}" alt="">
                        </div>
                    </div>
                </#if>
                <div class="form-group row">
                    <div class="col-2">
                        <button type="submit" class="btn btn-primary">
                            <#if isCreate>Создать курс<#else>Сохранить изменения</#if>
                        </button>
                    </div>
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="activeCourse" name="active"
                                   <#if !isCreate && course.active??>checked</#if>>
                            <label class="form-check-label" for="activeCourse">
                                Активировать курс
                            </label>
                        </div>
                    </div>
                </div>
            </form>
            <#if !isCreate && course.imgName??>
                <form action="/constructor/course/${course.id}/imgdelete" method="get">
                    <button type="submit" class="btn btn-primary">Удалить изображение</button>
                </form>
            </#if>
        </div>
    </div>
</#macro>