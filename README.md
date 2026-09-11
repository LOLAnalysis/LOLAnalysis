# 🎮 League of Legends Game Balance & Predictive Analytics Pipeline

<p align="center">
  <b>Modern Veri Yığını (BigQuery, dbt, Python) ve Makine Öğrenmesi ile League of Legends Maç Sonuçları, Meta Eğilimleri ve Denge Analizi.</b>
</p>

<p align="center">
  <a href="https://datastudio.google.com/reporting/d01e5cbf-a3a2-4cad-a758-828d32863e73" target="_blank">🌐 Canlı Looker Studio Dashboard</a> •
  <a href="#-proje-mimarisi-ve-teknoloji-yığını">⚙️ Mimari</a> •
  <a href="#-proje-dizin-yapısı">📁 Dizin Yapısı</a> •
  <a href="#-analiz-modülleri-ve-kpi">📊 Bulgular</a>
</p>

---

## 🚀 Proje Hakkında

Bu proje; Sezon 3 ile Sezon 8 arasındaki **184,069 maçlık** tarihi League of Legends verisini inceleyerek, oyun içi hedeflerin (kule, ejderha, alamet), şampiyon meta dengelerinin ve eşya kombinasyonlarının maç sonuçlarına etkisini analiz eden uçtan uca bir veri bilimi ve mühendisliği çalışmasıdır.

Ham veriler dbt ile modellenmiş, Lojistik Regresyon modelleriyle maç sonucu ve hedef önemi tahmin edilmiş; elde edilen tüm bulgular interaktif Looker Studio panosunda görselleştirilmiştir.

---

## 🛠️ Proje Mimarisi ve Teknoloji Yığını

* **Veri Ambarı:** Google BigQuery
* **Veri Modelleme & Dönüştürme:** dbt (data build tool) - Staging, Intermediate ve Mart katmanları
* **Makine Öğrenmesi & Analiz:** Python, Scikit-Learn (Lojistik Regresyon, %80/20 Train/Test ayrımı, %80.0 Model Doğruluğu, 0.87 ROC-AUC)
* **Görselleştirme:** Looker Studio (Google Data Studio)

---

## 📌 Temel Analiz Modülleri & Bulgular

### 1. Macro & Objective Impact Analysis (Makro Objektif Önem Analizi)
* **Kritik Hedefler:** Lojistik Regresyon modeli sonuçlarına göre ilk kule ($4.23$ katsayısı) ve ilk ejderha ($2.93$ katsayısı) galibiyete en yüksek etkiyi eden makro faktörlerdir.
* **Comeback (Geri Dönüş) Riskleri:** "Tam Felakat" (0-4 geride başlama) senaryosunda geri dönüş neredeyse imkansızken (%24.9 mağlubiyet riski), erken aşamadaki kule ve ilk kan kayıpları takımları doğrudan büyük bir dezavantaja sokmaktadır.

### 2. Champion & Item Balance (Şampiyon ve Eşya Denge Analizi)
* **Meta Liderleri:** Thresh (%2.7 seçilme oranı ile meta lideri), Asir ve Skarner gibi şampiyonların denge ve güçlendirme/zayıflatma adayları üzerindeki etkileri detaylı modellenmiştir.
* **Eşya Performansları:** Ebedi Kılıç meta lideri efsanevi eşya olarak öne çıkarken; Mejai'nin Ruhiyeyeni gibi eşyaların genellikle önde olan oyuncular tarafından tercih edildiği istatistiki olarak gösterilmiştir.

### 3. Match Outcome Prediction (Maç Sonucu Tahmin Modeli)
* **Model Performansı:** Lojistik Regresyon sınıflandırma algoritmasıyla kurulan model **%80.0 Doğruluk (Accuracy)** ve **0.87 ROC-AUC** skoru elde etmiştir.
* **Temel Faktörler:** Altın kazanımı, asist ve skor performansı galibiyete pozitif etki yaparken; yüksek ölüm sayısı başarısızlık riskini katlanarak artırmaktadır.

---

## 📁 Proje Dizin Yapısı

Projenin modüler dbt ve analiz yapısı şu şekildedir:

```text
.
├── analyses/                     # Ad-hoc SQL sorguları ve özel analizler
├── macros/                       # dbt özel makroları
├── models/                       # dbt model katmanları
│   ├── intermediate/             # Ara katman dönüşümleri (örn. int_team_win_status.sql)
│   ├── marts/                    # İş zekası ve raporlama için nihai tablolar (fct_*)
│   └── staging/                  # Ham verileri temizleyen ilk katman (stg_*)
├── seeds/                        # Statik başlangıç verileri ve CSV'ler
├── snapshots/                    # dbt yavaş değişen boyut konfigürasyonları
├── tests/                        # Veri kalitesi testleri
├── .gitignore                    # Git ignore kuralları
├── README.md                     # Proje dokümantasyonu
└── dbt_project.yml               # dbt proje konfigürasyon dosyası
```

---

## 📊 Dashboards & Media

* 🔗 **Canlı Looker Studio Panosu:** [Looker Studio Raporunu İncele](https://datastudio.google.com/reporting/d01e5cbf-a3a2-4cad-a758-828d32863e73)
* 📄 **Sunum & Rapor Görselleri:** Proje sunumuna ait ekran görüntüleri `/docs` klasöründe yer almaktadır.

---

## 👥 Katkıda Bulunanlar

* **Ertuğrul Karamanlı** - [LinkedIn](https://www.linkedin.com/in/ertugrulkaramanli/) | [GitHub](https://github.com/ErtugrulKaramanli)
