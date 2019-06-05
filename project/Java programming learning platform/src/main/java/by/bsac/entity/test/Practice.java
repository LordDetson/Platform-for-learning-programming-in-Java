package by.bsac.entity.test;

import by.bsac.entity.Document;
import by.bsac.entity.Grade;

import javax.persistence.*;

@Entity
public class Practice {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String content;

    @OneToOne
    @JoinColumn(name = "document_id")
    private Document document;

    @OneToOne(mappedBy = "practice")
    private Grade grade;
}
