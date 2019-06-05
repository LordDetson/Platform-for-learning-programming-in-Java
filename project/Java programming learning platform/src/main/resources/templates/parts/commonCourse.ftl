<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${course.name}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">

        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
    <#include "navbar.ftl">
    <div class="container-fluid">
        <div class="row">
            <nav class="col d-md-block sidebar">

                <div class="accordion mt-3" id="accordion">
                    <#list course.topics as topic>
                        <div class="card">
                            <div class="card-header" id="headingTopic${topic.id}">
                                <h2 class="mb-0">
                                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                            data-target="#collapseTopic${topic.id}" aria-expanded="true"
                                            aria-controls="collapseTopic${topic.id}">
                                        ${topic.name}
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseTopic${topic.id}" class="collapse"
                                 aria-labelledby="headingTopic${topic.id}"
                                 data-parent="#accordion">
                                <div class="card-body">

                                    <div class="nav flex-column nav-pills" id="v-pills-topic${topic.id}-tab"
                                         role="tablist"
                                         aria-orientation="vertical">
                                        <#list topic.pages as page>
                                            <a class="nav-link" id="v-pills-topic${topic.id}-tab"
                                               data-toggle="pill"
                                               href="#v-pills-topic${topic.id}-page${page.id}"
                                               role="tab" aria-controls="v-pills-topic${topic.id}-page${page.id}" aria-selected="true">${page.name}</a>
                                        </#list>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </#list>
                </div>

            </nav>
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <div class="container mt-5">
                    <#nested>
                </div>
            </main>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>