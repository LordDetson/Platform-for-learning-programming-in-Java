<#import "parts/commonCourse.ftl" as c>
<@c.page>
    <div class="col">
        <div class="tab-content" id="v-pills-tabContent">
            <#list course.topics as topic>
                <#list topic.pages as page>
                    <div class="tab-pane fade" id="v-pills-topic${topic.id}-page${page.id}" role="tabpanel"
                         aria-labelledby="v-pills-topic${topic.id}-tab">
                        <h3 class="mb-3">${page.name}</h3>
                        <hr>
                        ${page.getContent(tools)}
                    </div>
                </#list>
            </#list>
        </div>
    </div>
</@c.page>