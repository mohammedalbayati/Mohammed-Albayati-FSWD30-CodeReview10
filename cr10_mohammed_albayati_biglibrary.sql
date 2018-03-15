-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mrz 2018 um 13:08
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_mohammed_albayati_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Katja', 'Brandis'),
(2, 'Wolfgang', 'Herrendorf'),
(3, 'Isaac', 'Asimov'),
(4, 'Gillian', 'Flynn'),
(5, 'Dan', 'Brown'),
(6, 'J.K.', 'Rowling'),
(7, 'Bob', 'Dylan'),
(8, 'Sade', ''),
(9, 'Ed', 'Sheeran'),
(10, 'Pink', ''),
(11, 'Blink 182', ''),
(12, 'Alicia', 'Keys'),
(13, 'Charlie', 'Chaplin'),
(14, 'Mario', 'Puzo'),
(15, 'Chuck', 'Palahniuk'),
(16, 'Christopher ', 'Nolan'),
(17, 'Nicholas ', 'Pileggi'),
(18, 'The Wachowski Brothers', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_media_id` int(11) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `fk_author_id` int(11) NOT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `ISBN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`media_id`, `fk_author_id`, `fk_publisher_id`, `type`, `title`, `image`, `description`, `ISBN`) VALUES
(1, 1, 1, 'book', 'Wooldwalkers', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvUZBLE6NYd8iZVsjDUuT0DDMAzRXUNHB4vNn82RipZlqFRQyRQ', 'Auf den ersten Blick sieht Carag aus wie ein normaler Junge. Doch hinter seinen leuchtenden Augen verbirgt sich ein Geheimnis: Carag ist ein Gestaltwandler.', 9781120215000),
(2, 2, 2, 'book', 'Tschick', 'http://is3.mzstatic.com/image/thumb/Publication4/v4/14/03/dd/1403dd73-7db3-e5ae-9307-549e53bf1488/source/270x270bb.jpg', 'Diamond Life is the debut studio album by English band Sade. It was first released in the United Kingdom on 16 July 1984 by Epic Records and in the United States on 27 February ', 9781120215017),
(3, 3, 3, 'book', 'Foundation', 'https://loveinbooks.files.wordpress.com/2015/05/isaac-asimov-foundation.jpg?w=182&h=300', 'For twelve thousand years the Galactic Empire has ruled supreme. Now it is dying. But only Hari Seldon, creator of the revolutionary science of psychohistory, ', 9781120215024),
(4, 4, 4, 'book', 'Gone Girl', 'https://thehaguebookclub.files.wordpress.com/2015/01/gone-girl.png?w=196&h=300', 'On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary.', 9781120215031),
(5, 5, 5, 'book', 'Origin', 'https://s8.pik.ba/galerija/2017-10/05/12/slika-341077-59d60a70adbb0-velika.jpg', 'Robert Langdon, Harvard professor of symbology and religious iconology, arrives at the ultramodern Guggenheim ', 9781120215048),
(6, 6, 6, 'book', 'HP and the Philosopher\'s Stone', 'https://www.myer.com.au/wcsstore/MyerCatalogAssetStore/images/65/650/5225/12/6/248981500_248980060/248981500_248980060_zm_1.jpg', 'When a letter arrives for unhappy but ordinary Harry Potter,', 9781120215055),
(7, 7, 7, 'cd', 'Dylan', 'https://lastfm-img2.akamaized.net/i/u/ar0/4a624c2d9eff44688064e0a1b259988e', 'Dylan is the 13th studio album by American singer-songwriter Bob Dylan, released on November 19, 1973 by Columbia Records.', 9781120215062),
(8, 8, 8, 'cd', 'Diamond Life', 'https://media.senscritique.com/media/000007079793/source_big/Diamond_Life.jpg', 'Diamond Life is the debut studio album by English band Sade. It was first released in the United Kingdom on 16 July 1984 by Epic ', 9781120215079),
(9, 9, 9, 'cd', 'Divide', 'https://tgm-liveweb-prod.s3.amazonaws.com/assets/editorial/2017/03/divide_album_cover.jpg', '÷ (pronounced \"divide\") is the third studio album by English singer-songwriter Ed Sheeran. It was released on ', 9781120215086),
(10, 10, 10, 'cd', 'Beautiful Trauma', 'https://newmusic24.ru/wp-content/uploads/2017/10/Pink-Whatever-You-Want.jpg', 'Beautiful Trauma is the seventh studio album by American singer Pink.', 9781120215093),
(11, 11, 11, 'cd', 'California', 'https://echosrecordbar.co.za/images/database_images/catelogue/large/99357_521.jpg', 'California is the seventh studio album by American rock band Blink-182, ', 9781120215109),
(12, 12, 10, 'cd', 'Here', 'https://img.wennermedia.com/920-width/alicia-keys-here-27bd2ff2-964c-4b47-adce-ce8e7a790e58.jpg', 'Here (stylized as HERE) is the sixth studio album by American singer and songwriter Alicia Keys. It was released on November 4, ', 9781120215123),
(13, 13, 13, 'dvd', 'City Lights', 'https://78.media.tumblr.com/1b6c6855886c7bbff13d1818ead69b2d/tumblr_mw7lne25Im1qebry0o2_1280.jpg', 'With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a sightless flower ', 9781120215130),
(14, 14, 14, 'dvd', 'The Godfather', 'https://ep01.epimg.net/brasil/imagenes/2017/12/05/cultura/1512477938_309500_1512751420_sumario_normal.jpg', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9781120215116),
(15, 15, 15, 'dvd', 'Fight Club', 'https://lazypenguins.com/wp-content/uploads/2015/09/Fight-Club.jpg', 'An insomniac office worker, looking for a way to change his life, ', 9781120215147),
(16, 16, 16, 'dvd', 'Inception', 'http://www.apicius.es/wp-content/uploads/2012/07/IMG-20120714-009211.jpg', 'A thief, who steals corporate secrets through the use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.', 9781120215154),
(17, 17, 16, 'dvd', 'Good Fellas', 'https://moeatthemovies.files.wordpress.com/2013/04/goodfellas_xlg.jpg', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife ', 9781120215161),
(18, 18, 15, 'dvd', 'The Matrix', 'https://static.secure.website/wscfus/9587399/6968915/the-matrix-poster-w1000-o.jpg', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role ', 9781120215178);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `size` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`, `size`) VALUES
(1, 'Bild', 'Berlin', 'large'),
(2, 'Rowohlt Taschenbuch Verlag', 'Reinbek', 'large'),
(3, 'Heyne', 'München', 'large'),
(4, 'Crown Publishing Group', 'Danvers', 'medium'),
(5, 'Doubleday', 'New York City', 'large'),
(6, 'Bloomsbury', 'London', 'medium'),
(7, 'Columbia Records', 'New York City', 'large'),
(8, 'Epic Records', 'New York City', 'large'),
(9, 'Atlantic Records UK', 'New York', 'large'),
(10, 'RCA Records', 'New York City', 'large'),
(11, 'BMG Chrysalis', 'Los Angeles', 'medium'),
(13, 'Charles Chaplin Production', 'London', 'small'),
(14, 'Alfran Productions', NULL, 'small'),
(15, '20th Century Fox', 'Los Angeles', 'large'),
(16, 'Warner Bros.', 'Los Angeles', 'large');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(22) NOT NULL,
  `birthday` date NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `gender`, `birthday`, `user_email`, `user_pass`) VALUES
(10, 'Alex', 'Admin', 'others', '0000-00-00', 'Alex@gmail.com', '112233');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_media_id` (`fk_media_id`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`fk_media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
