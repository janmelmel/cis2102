-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 03:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usc-library-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `library_items`
--

CREATE TABLE `library_items` (
  `book_code` text NOT NULL,
  `title` text NOT NULL,
  `authors` text NOT NULL,
  `year_published` year(4) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `availability` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library_items`
--

INSERT INTO `library_items` (`book_code`, `title`, `authors`, `year_published`, `description`, `price`, `availability`, `date_added`) VALUES
('BWVM-VKWZ-6F2K-3RKU', 'Heaven Official&#039;s Blessing: Tian Guan Ci Fu, Vol. 1 (Paperback)', 'Mo Xiang Tong Xiu', 2021, 'Born the crown prince of a prosperous kingdom, Xie Lian was renowned for his beauty, strength, and purity. His years of dedicated study and noble deeds allowed him to ascend to godhood. But those who rise may also fall, and fall he does--cast from the heavens and banished to the world below.\r\n \r\nEight hundred years after his mortal life, Xie Lian has ascended to godhood for the third time, angering most of the gods in the process. To repay his debts, he is sent to the Mortal Realm to hunt down violent ghosts and troublemaking spirits who prey on the living. Along his travels, he meets the fascinating and brilliant San Lang, a young man with whom he feels an instant connection. Yet San Lang is clearly more than he appears... What mysteries lie behind that carefree smile?\r\n \r\nThis Chinese xianxia fantasy novel series built around the romanticized love between two men (danmei) is the newest work from author Mo Xiang Tong Xiu, and has spawned an ongoing multimedia franchise that&#039;s beloved across the world--including the animated series (donghua) that amassed 100+ million views in just its first month. The Seven Seas English-language edition will include covers from 日出的小太陽 (tai3_3), and exclusive, all-new interior illustrations from ZeldaCW.', 1079, 0, '2022-07-23 18:07:06'),
('ZX22-Y2FL-JW88-CNLE', 'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life, Export Edition (Paperback)', 'Mark Manson', 2018, 'In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be &quot;positive&quot; all the time so that we can truly become better, happier people.\r\n\r\nFor decades, we&rsquo;ve been told that positive thinking is the key to a happy, rich life. &quot;F**k positivity,&quot; Mark Manson says. &quot;Let&rsquo;s be honest, shit is f**ked and we have to live with it.&quot; In his wildly popular Internet blog, Mason doesn&rsquo;t sugarcoat or equivocate. He tells it like it is&mdash;a dose of raw, refreshing, honest truth that is sorely lacking today. The Subtle Art of Not Giving a F**k is his antidote to the coddling, let&rsquo;s-all-feel-good mindset that has infected American society and spoiled a generation, rewarding them with gold medals just for showing up.\r\n\r\nManson makes the argument, backed both by academic research and well-timed poop jokes, that improving our lives hinges not on our ability to turn lemons into lemonade, but on learning to stomach lemons better. Human beings are flawed and limited&mdash;&quot;not everybody can be extraordinary, there are winners and losers in society, and some of it is not fair or your fault.&quot; Manson advises us to get to know our limitations and accept them. Once we embrace our fears, faults, and uncertainties, once we stop running and avoiding and start confronting painful truths, we can begin to find the courage, perseverance, honesty, responsibility, curiosity, and forgiveness we seek.\r\n\r\nThere are only so many things we can give a f**k about so we need to figure out which ones really matter, Manson makes clear. While money is nice, caring about what you do with your life is better, because true wealth is about experience. A much-needed grab-you-by-the-shoulders-and-look-you-in-the-eye moment of real-talk, filled with entertaining stories and profane, ruthless humor, The Subtle Art of Not Giving a F**k is a refreshing slap for a generation to help them lead contented, grounded lives.', 799, 1, '2022-07-23 18:08:37'),
('GKVF-ELT8-JPQU-3ZL4', 'The Daily Stoic: 366 Meditations on Wisdom, Perseverance, and the Art of Living (Hardcover)', 'Stephen Hanselman', 2016, 'Why have history&#039;s greatest minds&mdash;from George Washington to Frederick the Great to Ralph Waldo Emerson, along with today&#039;s top performers from Super Bowl-winning football coaches to CEOs and celebrities&mdash;embraced the wisdom of the ancient Stoics? Because they realize that the most valuable wisdom is timeless and that philosophy is for living a better life, not a classroom exercise.\r\n\r\nThe Daily Stoic offers 366 days of Stoic insights and exercises, featuring all-new translations from the Emperor Marcus Aurelius, the playwright Seneca, or slave-turned-philosopher Epictetus, as well as lesser-known luminaries like Zeno, Cleanthes, and Musonius Rufus. Every day of the year you&#039;ll find one of their pithy, powerful quotations, as well as historical anecdotes, provocative commentary, and a helpful glossary of Greek terms.\r\n\r\nBy following these teachings over the course of a year (and, indeed, for years to come) you&#039;ll find the serenity, self-knowledge, and resilience you need to live well. ', 675, 1, '2022-07-23 18:12:13'),
('5BNR-CP8S-VNH2-79BR', 'The Little Prince (Paperback)', 'Antoine de Saint-Exup&eacute;ry', 2000, 'A pilot crashes in the Sahara Desert and encounters a strange young boy who calls himself the Little Prince. The Little Prince has traveled there from his home on a lonely, distant asteroid with a single rose. The story that follows is a beautiful and at times heartbreaking meditation on human nature.\r\n\r\nThe Little Prince is one of the best-selling and most translated books of all time, universally cherished by children and adults alike, and Richard Howard&#039;s translation of the beloved classic beautifully reflects Saint-Exup&eacute;ry&#039;s unique and gifted style, bringing the English text as close as possible to the French in language, style, and spirit. In this special edition, the artwork has been restored to match in detail and in color Saint-Exup&eacute;ry&#039;s original artwork.\r\n\r\nThis definitive English-language edition of The Little Prince will capture the hearts of readers of all ages.', 225, 1, '2022-07-23 18:13:42'),
('RN9X-DNUJ-283J-ASPA', 'The Love Hypothesis (Paperback)', 'Ali Hazelwood', 2021, 'As a third-year Ph.D. candidate, Olive Smith doesn&#039;t believe in lasting romantic relationships--but her best friend does, and that&#039;s what got her into this situation. Convincing Anh that Olive is dating and well on her way to a happily ever after was always going to take more than hand-wavy Jedi mind tricks: Scientists require proof. So, like any self-respecting biologist, Olive panics and kisses the first man she sees.\r\n\r\nThat man is none other than Adam Carlsen, a young hotshot professor--and well-known ass. Which is why Olive is positively floored when Stanford&#039;s reigning lab tyrant agrees to keep her charade a secret and be her fake boyfriend. But when a big science conference goes haywire, putting Olive&#039;s career on the Bunsen burner, Adam surprises her again with his unyielding support and even more unyielding...six-pack abs.\r\n\r\nSuddenly their little experiment feels dangerously close to combustion. And Olive discovers that the only thing more complicated than a hypothesis on love is putting her own heart under the microscope.', 832, 0, '2022-07-23 18:24:18'),
('EUNA-5Q4B-HMT8-FFBS', 'Atomic Habits: An Easy &amp; Proven Way to Build Good Habits &amp; Break Bad Ones (Hardcover)', 'James Clear', 2018, 'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world&#039;s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.\r\n\r\nIf you&#039;re having trouble changing your habits, the problem isn&#039;t you. The problem is your system. Bad habits repeat themselves again and again not because you don&#039;t want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you&#039;ll get a proven system that can take you to new heights.\r\n\r\nClear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.\r\n\r\nLearn how to:\r\n&bull;	make time for new habits (even when life gets crazy);\r\n&bull;	overcome a lack of motivation and willpower;\r\n&bull;	design your environment to make success easier;\r\n&bull;	get back on track when you fall off course;\r\n...and much more.\r\n\r\nAtomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.\r\n', 1053, 0, '2022-07-23 18:26:49'),
('TX89-35CF-78NN-C5FE', 'Blink: The Power of Thinking Without Thinking (Mass Market)', 'Malcolm Gladwell', 2007, 'In his landmark bestseller The Tipping Point, Malcolm Gladwell redefined how we understand the world around us. Now, in Blink, he revolutionizes the way we understand the world within.\r\n\r\nBlink is a book about how we think without thinking, about choices that seem to be made in an instant-in the blink of an eye-that actually aren&#039;t as simple as they seem. Why are some people brilliant decision makers, while others are consistently inept? Why do some people follow their instincts and win, while others end up stumbling into error? How do our brains really work-in the office, in the classroom, in the kitchen, and in the bedroom? And why are the best decisions often those that are impossible to explain to others?\r\n\r\nIn Blink we meet the psychologist who has learned to predict whether a marriage will last, based on a few minutes of observing a couple; the tennis coach who knows when a player will double-fault before the racket even makes contact with the ball; the antiquities experts who recognize a fake at a glance. Here, too, are great failures of &quot;blink&quot;: the election of Warren Harding; &quot;New Coke&quot;; and the shooting of Amadou Diallo by police.\r\n\r\nBlink reveals that great decision makers aren&#039;t those who process the most information or spend the most time deliberating, but those who have perfected the art of &quot;thin-slicing&quot;-filtering the very few factors that matter from an overwhelming number of variables.', 549, 0, '2022-07-23 18:28:49'),
('WRWG-K9WY-K7CA-VUAU', 'As Good As Dead: A Good Girl&rsquo;s Guide to Murder, Book 3 (Paperback)', 'Holly Jackson', 2021, 'Pip is about to head to college, but she is still haunted by the way her last investigation ended. She&rsquo;s used to online death threats in the wake of her viral true-crime podcast, but she can&rsquo;t help noticing an anonymous person who keeps asking her: Who will look for you when you&rsquo;re the one who disappears?\r\n\r\nSoon the threats escalate and Pip realizes that someone is following her in real life. When she starts to find connections between her stalker and a local serial killer caught six years ago, she wonders if maybe the wrong man is behind bars.\r\n\r\nPolice refuse to act, so Pip has only one choice: find the suspect herself&mdash;or be the next victim. As the deadly game plays out, Pip discovers that everything in her small town is coming full circle . . .and if she doesn&rsquo;t find the answers, this time she will be the one who disappears. . .', 479, 0, '2022-07-23 18:34:02'),
('WDF8-4T92-Y56C-7ALZ', 'Good Girl, Bad Blood (Paperback)', 'Holly Jackson', 2022, 'Pip is not a detective anymore.\r\n\r\nWith the help of Ravi Singh, she released a true-crime podcast about the murder case they solved together last year. The podcast has gone viral, yet Pip insists her investigating days are behind her.\r\n\r\nBut she will have to break that promise when someone she knows goes missing. Jamie Reynolds has disappeared, on the very same night the town hosted a memorial for the sixth-year anniversary of the deaths of Andie Bell and Sal Singh.\r\n\r\nThe police won&#039;t do anything about it. And if they won&#039;t look for Jamie then Pip will, uncovering more of her town&#039;s dark secrets along the way... and this time everyone is listening. But will she find him before it&#039;s too late?', 479, 1, '2022-07-23 18:35:14'),
('YELV-XMTG-M6AH-T7JY', 'No Longer Human (Paperback)', 'Osamu Dazai', 1973, 'Portraying himself as a failure, the protagonist of Osamu Dazai&#039;s No Longer Human narrates a seemingly normal life even while he feels himself incapable of understanding human beings. Oba Yozo&#039;s attempts to reconcile himself to the world around him begin in early childhood, continue through high school, where he becomes a &quot;clown&quot; to mask his alienation, and eventually lead to a failed suicide attempt as an adult. Without sentimentality, he records the casual cruelties of life and its fleeting moments of human connection and tenderness.', 957, 1, '2022-07-23 18:36:37'),
('5UC9-XNZJ-ESDS-L2TA', 'Jujutsu Kaisen, Vol. 14 (Paperback)', 'Gege Akutami', 2022, 'In a world where cursed spirits feed on unsuspecting humans, fragments of the legendary and feared demon Ryomen Sukuna were lost and scattered about. Should any demon consume Sukuna&rsquo;s body parts, the power they gain could destroy the world as we know it. Fortunately, there exists a mysterious school of jujutsu sorcerers who exist to protect the precarious existence of the living from the supernatural!\r\n\r\nIn a world where cursed spirits feed on unsuspecting humans, fragments of the legendary and feared demon Ryomen Sukuna were lost and scattered about. Should any demon consume Sukuna&rsquo;s body parts, the power they gain could destroy the world as we know it. Fortunately, there exists a mysterious school of jujutsu sorcerers who exist to protect the precarious existence of the living from the supernatural!', 539, 1, '2022-07-23 18:37:46'),
('WCRC-FYQQ-93JJ-CMM9', 'Grandmaster of Demonic Cultivation: Mo Dao Zu Shi, Vol. 1 (Paperback)', 'Mo Xiang Tong Xiu', 2021, 'Wei Wuxian was once one of the most outstanding men of his generation, a talented and clever young cultivator who harnessed martial arts, knowledge, and spirituality into powerful abilities. But when the horrors of war led him to seek a new power through demonic cultivation, the world&#039;s respect for his skills turned to fear, and his eventual death was celebrated throughout the land.\r\n \r\nYears later, he awakens in the body of an aggrieved young man who sacrifices his soul so that Wei Wuxian can exact revenge on his behalf. Though granted a second life, Wei Wuxian is not free from his first, nor the mysteries that appear before him now. Yet this time, he&#039;ll face it all with the righteous and esteemed Lan Wangji at his side, another powerful cultivator whose unwavering dedication and shared memories of their past will help shine a light on the dark truths that surround them.\r\n \r\nThis Chinese xianxia fantasy novel series built around the romanticized love between two men (danmei) has been translated into numerous languages and spawned a multimedia franchise that has taken the globe by storm, including the massively popular live-action series The Untamed available now on Netflix, YouTube, and more. The Seven Seas English-language edition will include exclusive, all-new cover art from Jin Fang (jinzillaa), interior illustrations from Marina Privalova (BaoshanKaro), and a translation by Suika (yummysuika) with editor Pengie (pengiesama).', 999, 1, '2022-07-23 18:38:52'),
('GMB9-TR3W-TSR4-ELHZ', 'Ikigai: The Japanese Secret to a Long and Happy Life (Hardcover)', 'H&eacute;ctor Garc&iacute;a', 2017, 'According to the Japanese, everyone has an ikigai&mdash;a reason for living. And according to the residents of the Japanese village with the world&rsquo;s longest-living people, finding it is the key to a happier and longer life. Having a strong sense of ikigai&mdash;where what you love, what you&rsquo;re good at, what you can get paid for, and what the world needs all overlap&mdash;means that each day is infused with meaning. It&rsquo;s the reason we get up in the morning. It&rsquo;s also the reason many Japanese never really retire (in fact there&rsquo;s no word in Japanese that means retire in the sense it does in English): They remain active and work at what they enjoy, because they&rsquo;ve found a real purpose in life&mdash;the happiness of always being busy.\r\n\r\nIn researching this book, the authors interviewed the residents of the Japanese village with the highest percentage of 100-year-olds&mdash;one of the world&rsquo;s Blue Zones. Ikigai reveals the secrets to their longevity and happiness: how they eat, how they move, how they work, how they foster collaboration and community, and&mdash;their best-kept secret&mdash;how they find the ikigai that brings satisfaction to their lives. And it provides practical tools to help you discover your own ikigai. Because who doesn&rsquo;t want to find happiness in every day?', 1188, 1, '2022-07-23 18:40:13'),
('CF7N-UWD8-VBLV-JPWF', 'The Alchemist: 25th Anniversary (Mass Market)', 'Paulo Coelho', 2014, '&ldquo;A magical little volume.&rdquo;―San Francisco Chronicle\r\n\r\nEvery few decades a book is published that changes the lives of its readers forever. The Alchemist is such a book.\r\n\r\nThe Alchemist is the story of Santiago, an Audalusian shepherd boy who travels in search of a worldly treasure. From his home in Spain he journeys to the markets of Tangiers and across the Egyptian desert to a fateful encounter with the alchemist.\r\n\r\nThe story of the treasures Santiago finds along the way teaches readers, as only a few stories have done, about the essential wisdom of listening to our hearts, learning to read the omens strewn along life&rsquo;s path, and above all, following their dreams.', 485, 1, '2022-07-23 18:41:16'),
('EEWZ-VYHZ-8VRE-MPUE', 'The Daily Stoic: 366 Meditations on Wisdom, Perseverance, and the Art of Living (Paperback)', 'Ryan Holiday', 2016, 'Why have history&#039;s greatest minds&mdash;from George Washington to Frederick the Great to Ralph Waldo Emerson, along with today&#039;s top performers from Super Bowl-winning football coaches to CEOs and celebrities&mdash;embraced the wisdom of the ancient Stoics? Because they realize that the most valuable wisdom is timeless and that philosophy is for living a better life, not a classroom exercise.\r\n\r\nThe Daily Stoic offers 366 days of Stoic insights and exercises, featuring all-new translations from the Emperor Marcus Aurelius, the playwright Seneca, or slave-turned-philosopher Epictetus, as well as lesser-known luminaries like Zeno, Cleanthes, and Musonius Rufus. Every day of the year you&#039;ll find one of their pithy, powerful quotations, as well as historical anecdotes, provocative commentary, and a helpful glossary of Greek terms.\r\n\r\nBy following these teachings over the course of a year (and, indeed, for years to come) you&#039;ll find the serenity, self-knowledge, and resilience you need to live well. ', 475, 1, '2022-07-23 18:42:29'),
('4EN4-RBCT-A74B-WV2Z', 'Trese, Vol. 2: Unreported Murders (Paperback)', 'Budjette Tan, Kajo Baldisimo', 2021, 'Award-winning Filipino comic, and soon to be Netflix anime series!\r\n\r\nWhen dusk arrives in the city of Manila, that&rsquo;s when you become the most likely prey of the underworld. Kidnappers and thieves will be the least of your worries.\r\n\r\nBeware the criminals that can&rsquo;t be bound with handcuffs nor harmed with bullets.\r\n\r\nBeware the ones that crave for your blood, those who hold your heart ransom, and the ones that come to steal your soul.\r\n\r\nWhen crime takes a turn for the weird, the police call Alexandra Trese.\r\n\r\nTrese Vol 2 &quot;Unreported Murders&rdquo; contains four mysteries for Alexandra Trese to solve; including a murdered dwarven-creature, a police station held under siege by the undead, an elusive serial killer living in the sewers of the city, and an unassuming gated-community that&rsquo;s willing to pay the price to live the privileged life. All the stories feature updated/re-mastered artwork, and a substantial bonus section about the monsters of Philippine myth, as told by its creators Budjette Tan and Kajo Baldisimo!', 235, 1, '2022-07-23 18:44:23'),
('6K69-WQYM-WN8F-M9NZ', 'House of Sky and Breath: Crescent City Book 2 (Paperback)', 'Sarah J. Maas', 2022, 'Bryce Quinlan and Hunt Athalar are trying to get back to normal―they may have saved Crescent City, but with so much upheaval in their lives lately, they mostly want a chance to relax. Slow down. Figure out what the future holds.\r\n\r\nThe Asteri have kept their word so far, leaving Bryce and Hunt alone. But with the rebels chipping away at the Asteri&rsquo;s power, the threat the rulers pose is growing. As Bryce, Hunt, and their friends get pulled into the rebels&rsquo; plans, the choice becomes clear: stay silent while others are oppressed, or fight for what&rsquo;s right. And they&rsquo;ve never been very good at staying silent.\r\n\r\nIn this sexy, action-packed sequel to the #1 bestseller House of Earth and Blood, Sarah J. Maas weaves a captivating story of a world about to explode―and the people who will do anything to save it.', 1049, 1, '2022-07-25 13:56:29'),
('THISISACODE', 'THISISATEST', 'TEST', 2019, 'TEST', 1000, 0, '2022-07-27 15:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `library_transactions`
--

CREATE TABLE `library_transactions` (
  `user_id` text NOT NULL,
  `timestamp_created` datetime NOT NULL DEFAULT current_timestamp(),
  `timestamp_released` datetime DEFAULT NULL,
  `timestamp_returned` timestamp NULL DEFAULT NULL,
  `book_code` text NOT NULL,
  `status` text DEFAULT '0' COMMENT 'not ready: 0; ready: 1; claimed: 2; returned: 3',
  `released_by` text DEFAULT NULL,
  `claim_notes` text DEFAULT NULL,
  `return_notes` text DEFAULT NULL,
  `is_borrow` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library_transactions`
--

INSERT INTO `library_transactions` (`user_id`, `timestamp_created`, `timestamp_released`, `timestamp_returned`, `book_code`, `status`, `released_by`, `claim_notes`, `return_notes`, `is_borrow`) VALUES
('19101668', '2022-07-27 13:13:22', '2022-07-27 13:17:39', '2022-07-27 05:20:22', 'TX89-35CF-78NN-C5FE', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:24', '2022-07-27 13:17:48', '2022-07-27 05:20:28', 'WRWG-K9WY-K7CA-VUAU', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:26', '2022-07-27 13:18:02', '2022-07-27 05:20:33', 'WDF8-4T92-Y56C-7ALZ', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:28', '2022-07-27 13:18:10', '2022-07-27 05:20:37', 'YELV-XMTG-M6AH-T7JY', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:33', '2022-07-27 13:17:31', '2022-07-27 05:20:18', 'EUNA-5Q4B-HMT8-FFBS', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:34', '2022-07-27 13:17:06', '2022-07-27 05:20:05', 'GKVF-ELT8-JPQU-3ZL4', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:36', '2022-07-27 13:17:19', '2022-07-27 05:20:09', '5BNR-CP8S-VNH2-79BR', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:37', '2022-07-27 13:17:22', '2022-07-27 05:20:13', 'RN9X-DNUJ-283J-ASPA', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:39', '2022-07-27 13:16:59', '2022-07-27 05:19:58', 'ZX22-Y2FL-JW88-CNLE', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:13:42', '2022-07-27 13:16:33', '2022-07-27 05:18:36', 'BWVM-VKWZ-6F2K-3RKU', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:20:55', '2022-07-27 13:24:01', '2022-07-27 05:24:03', 'BWVM-VKWZ-6F2K-3RKU', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:21:07', '2022-07-27 13:23:52', '2022-07-27 05:24:16', 'RN9X-DNUJ-283J-ASPA', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:25:27', '2022-07-27 13:25:46', '2022-07-27 05:25:57', 'BWVM-VKWZ-6F2K-3RKU', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:26:30', '2022-07-27 13:26:51', '2022-07-27 05:26:58', '6K69-WQYM-WN8F-M9NZ', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 13:27:23', '2022-07-27 13:30:50', NULL, '4EN4-RBCT-A74B-WV2Z', '2', '00000000', '', NULL, 0),
('19101668', '2022-07-27 13:30:47', '2022-07-27 13:31:01', '2022-07-27 05:31:52', 'WDF8-4T92-Y56C-7ALZ', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 15:00:51', '2022-07-27 15:01:49', '2022-07-27 07:02:03', 'RN9X-DNUJ-283J-ASPA', '3', '00000000', '', '', 0),
('19101668', '2022-07-27 15:02:21', '2022-07-27 15:02:55', NULL, 'GKVF-ELT8-JPQU-3ZL4', '2', '00000000', '', NULL, 0),
('19101668', '2022-07-27 15:02:50', '2022-07-27 15:03:04', '2022-07-27 07:03:21', '5UC9-XNZJ-ESDS-L2TA', '3', '00000000', '', '', 1),
('19101668', '2022-07-27 15:07:12', '2022-07-28 01:07:55', NULL, 'WDF8-4T92-Y56C-7ALZ', '2', '00000000', '', NULL, 0),
('19101668', '2022-07-28 01:08:32', '2022-07-28 01:09:01', NULL, 'THISISACODE', '2', '00000000', '', NULL, 0),
('19101668', '2022-07-28 01:08:40', '2022-07-28 01:09:08', '2022-07-27 17:09:24', '6K69-WQYM-WN8F-M9NZ', '3', '00000000', '', '', 1),
('19101668', '2022-07-28 01:08:46', '2022-07-28 01:09:16', '2022-07-27 17:09:28', '5UC9-XNZJ-ESDS-L2TA', '3', '00000000', '', '', 1),
('19101668', '2022-07-28 01:10:07', '2022-07-28 01:10:21', '2022-07-27 17:11:13', 'GMB9-TR3W-TSR4-ELHZ', '3', '00000000', '', '', 1),
('19101668', '2022-07-28 01:10:08', '2022-07-28 01:10:27', '2022-07-27 17:11:17', 'WCRC-FYQQ-93JJ-CMM9', '3', '00000000', '', '', 1),
('19101668', '2022-07-28 01:13:10', NULL, NULL, 'TX89-35CF-78NN-C5FE', '0', NULL, NULL, NULL, 0),
('19101668', '2022-11-18 09:38:11', NULL, NULL, 'WRWG-K9WY-K7CA-VUAU', '0', NULL, NULL, NULL, 0),
('19101668', '2022-11-18 10:09:46', NULL, NULL, 'EUNA-5Q4B-HMT8-FFBS', '0', NULL, NULL, NULL, 1),
('19101668', '2022-11-18 10:10:11', NULL, NULL, 'RN9X-DNUJ-283J-ASPA', '0', NULL, NULL, NULL, 0),
('19101668', '2022-11-18 10:10:35', NULL, NULL, 'BWVM-VKWZ-6F2K-3RKU', '0', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` text NOT NULL,
  `amount` float NOT NULL,
  `description` text NOT NULL,
  `issued_by` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `timestamp`, `user_id`, `amount`, `description`, `issued_by`) VALUES
(1, '2022-07-27 13:09:36', '19101668', 900, 'Fund Transfer', '00000000'),
(2, '2022-07-27 13:09:41', '19101668', 800, 'Fund Transfer', '00000000'),
(3, '2022-07-27 13:09:43', '19101668', 700, 'Fund Transfer', '00000000'),
(4, '2022-07-27 13:09:46', '19101668', 600, 'Fund Transfer', '00000000'),
(5, '2022-07-27 13:09:49', '19101668', 500, 'Fund Transfer', '00000000'),
(6, '2022-07-27 13:09:52', '19101668', 400, 'Fund Transfer', '00000000'),
(7, '2022-07-27 13:09:56', '19101668', 300, 'Fund Transfer', '00000000'),
(8, '2022-07-27 13:09:59', '19101668', 200, 'Fund Transfer', '00000000'),
(9, '2022-07-27 13:10:03', '19101668', 100, 'Fund Transfer', '00000000'),
(10, '2022-07-27 13:10:05', '19101668', 1000, 'Fund Transfer', '00000000'),
(11, '2022-07-27 13:18:36', '19101668', -10, 'Borrowing Fees for BWVM-VKWZ-6F2K-3RKU', '00000000'),
(12, '2022-07-27 13:19:58', '19101668', -10, 'Borrowing Fees for ZX22-Y2FL-JW88-CNLE', '00000000'),
(13, '2022-07-27 13:20:05', '19101668', -10, 'Borrowing Fees for GKVF-ELT8-JPQU-3ZL4', '00000000'),
(14, '2022-07-27 13:20:09', '19101668', -10, 'Borrowing Fees for 5BNR-CP8S-VNH2-79BR', '00000000'),
(15, '2022-07-27 13:20:13', '19101668', -10, 'Borrowing Fees for RN9X-DNUJ-283J-ASPA', '00000000'),
(16, '2022-07-27 13:20:18', '19101668', -10, 'Borrowing Fees for EUNA-5Q4B-HMT8-FFBS', '00000000'),
(17, '2022-07-27 13:20:22', '19101668', -10, 'Borrowing Fees for TX89-35CF-78NN-C5FE', '00000000'),
(18, '2022-07-27 13:20:28', '19101668', -10, 'Borrowing Fees for WRWG-K9WY-K7CA-VUAU', '00000000'),
(19, '2022-07-27 13:20:33', '19101668', -10, 'Borrowing Fees for WDF8-4T92-Y56C-7ALZ', '00000000'),
(20, '2022-07-27 13:20:37', '19101668', -10, 'Borrowing Fees for YELV-XMTG-M6AH-T7JY', '00000000'),
(21, '2022-07-27 13:24:03', '19101668', -10, 'Borrowing Fees for BWVM-VKWZ-6F2K-3RKU', '00000000'),
(22, '2022-07-27 13:24:16', '19101668', -10, 'Borrowing Fees for RN9X-DNUJ-283J-ASPA', '00000000'),
(23, '2022-07-27 13:25:57', '19101668', -10, 'Borrowing Fees for BWVM-VKWZ-6F2K-3RKU', '00000000'),
(24, '2022-07-27 13:26:58', '19101668', -10, 'Borrowing Fees for 6K69-WQYM-WN8F-M9NZ', '00000000'),
(25, '2022-07-27 13:27:23', '19101668', -235, 'Purchase of 4EN4-RBCT-A74B-WV2Z', 'automated'),
(26, '2022-07-27 13:31:52', '19101668', -10, 'Borrowing Fees for WDF8-4T92-Y56C-7ALZ', '00000000'),
(27, '2022-07-27 15:00:51', '19101668', -832, 'Purchase of RN9X-DNUJ-283J-ASPA', 'automated'),
(28, '2022-07-27 15:02:03', '19101668', -10, 'Borrowing Fees for RN9X-DNUJ-283J-ASPA', '00000000'),
(29, '2022-07-27 15:02:21', '19101668', -675, 'Purchase of GKVF-ELT8-JPQU-3ZL4', 'automated'),
(30, '2022-07-27 15:03:21', '19101668', -10, 'Borrowing Fees for 5UC9-XNZJ-ESDS-L2TA', '00000000'),
(31, '2022-07-27 15:05:19', '19101668', 1000, 'Fund Transfer', '00000000'),
(32, '2022-07-27 15:07:12', '19101668', -479, 'Purchase of WDF8-4T92-Y56C-7ALZ', 'automated'),
(33, '2022-07-28 01:08:32', '19101668', -1000, 'Purchase of THISISACODE', 'automated'),
(34, '2022-07-28 01:09:24', '19101668', -10, 'Borrowing Fees for 6K69-WQYM-WN8F-M9NZ', '00000000'),
(35, '2022-07-28 01:09:28', '19101668', -10, 'Borrowing Fees for 5UC9-XNZJ-ESDS-L2TA', '00000000'),
(36, '2022-07-28 01:11:13', '19101668', -10, 'Borrowing Fees for GMB9-TR3W-TSR4-ELHZ', '00000000'),
(37, '2022-07-28 01:11:17', '19101668', -10, 'Borrowing Fees for WCRC-FYQQ-93JJ-CMM9', '00000000'),
(38, '2022-07-28 01:13:10', '19101668', -549, 'Purchase of TX89-35CF-78NN-C5FE', 'automated'),
(39, '2022-11-18 09:38:11', '19101668', -479, 'Purchase of WRWG-K9WY-K7CA-VUAU', 'automated'),
(40, '2022-11-18 10:10:11', '19101668', -832, 'Purchase of RN9X-DNUJ-283J-ASPA', 'automated'),
(41, '2022-11-18 10:10:35', '19101668', -1079, 'Purchase of BWVM-VKWZ-6F2K-3RKU', 'automated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` text NOT NULL,
  `user_password` text NOT NULL,
  `surname` text NOT NULL,
  `given_name` text NOT NULL,
  `status` text NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_password`, `surname`, `given_name`, `status`, `balance`) VALUES
('19101668', 'd6ffc5842bedf88891b442f94c63fdb6', 'Tumampos', 'Mikael Vincent', 'enrolled', 130),
('00000000', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', 'admin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
