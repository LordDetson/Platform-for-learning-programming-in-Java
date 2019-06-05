package by.bsac.entity.test;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String content;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "question_teg",
            joinColumns = {@JoinColumn(name = "tag_id")},
            inverseJoinColumns = {@JoinColumn(name = "question_id")}
    )
    private Set<Tag> tags;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "test_question",
            joinColumns = {@JoinColumn(name = "test_id")},
            inverseJoinColumns = {@JoinColumn(name = "question_id")}
    )
    private Set<Test> tests;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Answer> answers;
}
