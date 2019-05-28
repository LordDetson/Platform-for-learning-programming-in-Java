package by.bsac.entity.test;

import javax.persistence.*;

@Entity
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String content;
    private Boolean isRight;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinTable(name = "question_id")
    private Question question;
}
