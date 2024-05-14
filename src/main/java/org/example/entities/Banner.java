package org.example.entities;

import lombok.*;

import jakarta.persistence.*;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity(name = "Banner")
@Table(name = "banner", schema = "bookshopweb")
public class Banner implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BannerID", nullable = false)
    private Integer bannerID;

    @Column(name = "Bannerimage", length = 1000)
    private String bannerImage;

    @Column(name = "Bannertype", length = 5)
    private String bannerType;

    @Column(name = "IDbookorcate")
    private Integer idbookorcate;
}