package by.bsac.entity.test;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "question_teg",
            joinColumns = {@JoinColumn(name = "question_id")},
            inverseJoinColumns = {@JoinColumn(name = "tag_id")}
    )
    private Set<Question> questions;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "test_tag",
            joinColumns = {@JoinColumn(name = "test_id")},
            inverseJoinColumns = {@JoinColumn(name = "tag_id")}
    )
    private Set<Test> tests;
}
