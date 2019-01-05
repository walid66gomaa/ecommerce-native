-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2019 at 04:57 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `allowComment` tinyint(1) NOT NULL DEFAULT '0',
  `allowAds` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `ordering`, `visibility`, `allowComment`, `allowAds`, `parent`) VALUES
(1, 'electrics', '', 2, 1, 1, 1, NULL),
(10, 'food', '', 1, 1, 1, 1, NULL),
(12, 'vehicle', '', 3, 1, 0, 0, NULL),
(13, 'mobil factory', 'mobil factoryggg ggggf  hh', 555, 1, 1, 1, NULL),
(14, 'cars', 'cars in all world', 0, 1, 1, 1, 12),
(15, 'motor', 'vvvvv', 0, 1, 1, 1, 12),
(16, 'cameras', '', 0, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `item_id`, `user_id`, `status`, `date`) VALUES
(69, 'Animi expedita commodi sed. Consequatur omnis est voluptatem repudiandae fugiat fugiat facilis. Porro neque atque voluptates autem velit dolores iusto. Ex reiciendis totam sunt laboriosam nesciunt.', 81, 10, 0, '2018-12-10'),
(70, 'Commodi illum iure quam aliquid veritatis nihil. Temporibus et voluptate eum quis quia. Quod omnis et dolor architecto impedit aliquam delectus. Fugit commodi eligendi ipsam at.', 76, 3, 0, '2018-12-10'),
(71, 'Iusto sit et ad possimus nihil suscipit a officia. Porro quia harum magnam eius eos excepturi. Ad minima consequatur magnam veniam ipsum unde. Velit iste voluptas non distinctio suscipit debitis culpa ut.', 10, 14, 0, '2018-12-10'),
(72, 'Accusantium animi ab iste numquam ut. Dolorum non sed adipisci minus quis voluptate quod.', 48, 13, 0, '2018-12-10'),
(73, 'Ipsa laudantium dolor consequatur accusamus eligendi nulla deserunt nisi. Possimus qui soluta molestiae non. Eligendi ipsum quis et explicabo explicabo incidunt aut. Et quam doloribus enim.', 42, 10, 0, '2018-12-10'),
(74, 'Earum et ea est ut labore facilis. Eos inventore sit minima asperiores aut. Blanditiis consequatur saepe voluptatum ullam sequi inventore quia.', 50, 15, 0, '2018-12-10'),
(75, 'Odio sit autem minus repellat non qui voluptas. Et facere id ea natus odio. Perferendis et exercitationem et aliquid ut voluptatibus quam itaque. Quia voluptates non tenetur enim tenetur itaque pariatur nam. Eos assumenda vel impedit odit enim magnam.', 53, 5, 0, '2018-12-10'),
(76, 'Id aut sit ea tempora adipisci labore. Aut voluptatem ad dicta nihil quasi dolore qui. Voluptatem rem nobis quod non vel quia fuga.', 49, 27, 0, '2018-12-10'),
(77, 'Sunt illo architecto aperiam iste est cum et. Omnis ea molestiae iure ad. Culpa adipisci illo blanditiis minima enim. Dicta voluptates vitae non eveniet temporibus aut placeat.', 73, 5, 0, '2018-12-10'),
(78, 'Qui amet ipsam aut. Deleniti ut ut sed laboriosam nisi quis. Itaque necessitatibus aut ipsam commodi. Fugit est ad ut. Qui labore quis nulla consequuntur.', 36, 6, 0, '2018-12-10'),
(79, 'Cumque ducimus ipsam earum corrupti. Voluptatem veritatis occaecati doloribus laborum culpa quis voluptas. Fugit eos architecto non dolorum qui voluptatem.', 66, 27, 0, '2018-12-10'),
(81, 'Vel recusandae sit voluptatum velit facere adipisci. Consequatur est reprehenderit ratione id consequatur. Est itaque aut voluptatem aut aut vel. Laudantium aut occaecati corporis consectetur non illum.', 68, 9, 0, '2018-12-10'),
(82, 'Repellat autem facere odio porro aut. Eum illo doloremque rerum eligendi in. Ut odio eos sint beatae est in omnis. Quo enim et illo et.', 14, 23, 0, '2018-12-10'),
(83, 'Rerum porro unde enim fuga illo. Esse quam blanditiis eveniet sequi tempora voluptatem reiciendis. Qui cupiditate aperiam ratione temporibus quaerat et optio.', 13, 8, 0, '2018-12-10'),
(84, 'Rerum ipsam et et in. Error nihil quisquam eos aliquid deleniti quis enim. Non et voluptate dolor quisquam. Nulla voluptatibus sunt tempora dolorem.', 35, 15, 0, '2018-12-10'),
(85, 'Omnis maxime rerum sit adipisci. Repudiandae molestias autem quas illum laboriosam eum. Quo corrupti et iusto quia sint.', 40, 25, 0, '2018-12-10'),
(87, 'Est fugit inventore enim molestias laudantium. Minima odit earum in qui est. Eligendi ut error natus quo excepturi harum.', 67, 8, 0, '2018-12-10'),
(88, 'Quod fugit ut harum sunt labore magnam a. Debitis veritatis omnis iure sapiente. Nulla aperiam voluptatibus ipsam quia praesentium earum accusamus.', 76, 3, 0, '2018-12-10'),
(89, 'Optio ut assumenda ut sit beatae. Pariatur consequuntur quod alias quisquam nam libero excepturi.', 24, 22, 0, '2018-12-10'),
(90, 'Vitae et eaque amet eligendi occaecati dolorem cum. Voluptatem commodi ut ipsam dolor eveniet id laboriosam. Magni optio ipsa repudiandae perspiciatis. Dolor eum ut doloribus ipsum.', 13, 9, 0, '2018-12-10'),
(91, 'Fugit atque facere quidem. Non et maiores sapiente rem qui quos eos. Placeat consequatur officia commodi hic.', 31, 20, 0, '2018-12-10'),
(92, 'Repellat suscipit dolorum facilis qui aliquam expedita. Temporibus quidem odio nihil voluptate. Repudiandae iusto magnam iste error. Rerum in ut et et quas tempore praesentium.', 80, 16, 0, '2018-12-10'),
(93, 'Ut ullam occaecati autem quas velit commodi doloremque quis. Cupiditate modi corrupti et.', 64, 29, 0, '2018-12-10'),
(94, 'Temporibus omnis doloribus et dolor dolore pariatur molestiae. Aut mollitia quia repellendus alias numquam rerum ducimus. Autem eos cum deserunt nostrum distinctio voluptatum qui et.', 43, 13, 0, '2018-12-10'),
(95, 'Ipsa nam ex aut incidunt sapiente. Velit dolore repudiandae quod velit modi numquam debitis. Maiores et nihil sapiente quia aut dolor.', 41, 1, 0, '2018-12-10'),
(96, 'Nostrum cupiditate deleniti adipisci nesciunt. Eaque odio perspiciatis voluptatem mollitia suscipit nihil. Sit aspernatur et aliquam repudiandae et sint vero. Quaerat aliquam doloribus voluptatem ab.', 42, 22, 0, '2018-12-10'),
(97, 'Omnis est nisi aut ut architecto. Voluptas recusandae laboriosam non voluptatibus. Accusantium deleniti voluptatem autem nam commodi velit. Animi commodi dolorem voluptatem quis at expedita.', 40, 21, 0, '2018-12-10'),
(98, 'Voluptatum veritatis veniam nam dignissimos repellat. Qui occaecati aut eos et eum qui. Ut velit itaque omnis aut.', 74, 7, 0, '2018-12-10'),
(100, 'Unde adipisci velit fugit quia est facilis vel vel. Quia est asperiores consequatur est. Mollitia debitis et maxime voluptas dolor est quo. Fugiat corporis et placeat nisi nesciunt.', 62, 14, 0, '2018-12-10'),
(101, 'Fugit quo veniam pariatur atque. Aspernatur tempora laudantium voluptatem quia est. Molestiae officia nisi ipsum omnis vero voluptas.', 37, 21, 0, '2018-12-10'),
(102, 'Id molestiae ipsam repellendus amet eveniet. Incidunt debitis aperiam mollitia voluptas et aut explicabo. Et rem ea omnis quisquam quidem eaque hic. Magni pariatur asperiores quam molestiae omnis consequatur et.', 24, 9, 0, '2018-12-10'),
(103, 'Veritatis est nesciunt tempora quod est aut perspiciatis. Dolor quia deleniti molestias cupiditate mollitia ut et asperiores. Rerum fugiat dolorem veniam consequatur vitae.', 56, 18, 0, '2018-12-10'),
(104, 'Veniam non ut nostrum tempore. Rerum quia laborum fuga ipsum ducimus rem itaque. Qui ut alias qui pariatur quia. Sit blanditiis quasi architecto soluta odio in et in.', 33, 7, 0, '2018-12-10'),
(105, 'Ipsam voluptates est sit et consectetur. Culpa autem voluptas corporis eos. Tenetur est occaecati velit eius. Aut repellat rerum iusto.', 42, 8, 0, '2018-12-10'),
(106, 'Illum natus et rem voluptas rerum. Nam autem velit unde est. Sapiente unde ab magni quasi quam sunt dolor.', 75, 20, 0, '2018-12-10'),
(107, 'Laborum voluptatem nesciunt est tempore illo est quia. Voluptates repudiandae exercitationem qui sit. Ut dolores cupiditate qui dignissimos vel repellat nostrum. Corporis quas eos quia sint odio aut.', 14, 8, 0, '2018-12-10'),
(108, 'A voluptatem fuga non unde perferendis. Et eos molestiae sit accusantium iure enim. Odit pariatur adipisci quos inventore ipsum qui qui.', 49, 18, 0, '2018-12-10'),
(109, 'Quo occaecati accusamus mollitia nostrum voluptatum. Distinctio occaecati sint porro numquam. Voluptatem voluptas optio est neque nostrum.', 33, 29, 0, '2018-12-10'),
(110, 'Qui dolorem fuga nobis earum saepe veritatis cum. Quaerat itaque officia itaque fugiat. Eius assumenda sint inventore aut. Laborum quia sed quo.', 50, 29, 0, '2018-12-10'),
(111, 'Adipisci porro reprehenderit voluptate. Magnam ea maxime omnis animi expedita. Totam dolorum in iusto. Quisquam sit ad eos molestias fugit ut.', 70, 2, 0, '2018-12-10'),
(112, 'Quia distinctio quae qui. Dolor est veritatis voluptatibus sint nobis in incidunt. Hic eum suscipit ut eius dicta optio. Reiciendis exercitationem neque porro.', 60, 15, 0, '2018-12-10'),
(113, 'Hic quis commodi veritatis excepturi quia eveniet. Consequatur enim error facilis voluptas unde. Facilis sit voluptas cum. Voluptatum vel quos aspernatur voluptas qui.', 5, 5, 0, '2018-12-10'),
(114, 'Autem minus expedita eveniet quia distinctio eveniet. Officiis dolor quis recusandae id corrupti minus et. Voluptatum odit quia alias blanditiis eum. Aut animi velit iusto tempora earum commodi nisi quae. Ea earum similique provident et non.', 12, 20, 0, '2018-12-10'),
(115, 'Tempore voluptas fugiat vel quibusdam et reiciendis minima. Praesentium culpa ea sapiente voluptatem. Est non quia pariatur illo rem ipsa. Numquam minima porro sed.', 35, 3, 0, '2018-12-10'),
(116, 'Repudiandae dolorem quia corrupti et vel sed. Aliquam est deserunt architecto nulla nesciunt ut ratione et. Maiores deleniti delectus aliquid dolor. Aut sed et reiciendis veniam assumenda.', 67, 4, 0, '2018-12-10'),
(117, 'Tempora officia aut voluptas veniam alias. Itaque laborum ipsa maiores dolorem ea. Delectus dolor optio ut totam est ipsum.', 57, 2, 0, '2018-12-10'),
(118, 'Sit vero dolorum consequatur quod ut nesciunt. Ad autem commodi repudiandae iusto odio. Sit quia quis et veritatis est.', 51, 26, 0, '2018-12-10'),
(119, 'Aut voluptatem sed occaecati amet et sunt aut. Vitae nulla minima voluptas excepturi voluptate numquam. Explicabo voluptas pariatur debitis iste. Sint atque voluptate eos deleniti nihil.', 25, 16, 0, '2018-12-10'),
(120, 'Architecto sequi laboriosam quas eligendi facere. Ea quaerat fugit qui eum. Nemo a omnis qui quibusdam tenetur.', 36, 25, 0, '2018-12-10'),
(121, 'Asperiores dolores accusamus est accusantium eum aut aperiam. Qui autem perferendis facilis quia. Quo corporis tempora voluptatem nulla tempore vel.', 81, 24, 0, '2018-12-10'),
(122, 'Quae quo voluptatem repellendus nihil voluptate. Ad ut debitis sed velit quo. Inventore laboriosam voluptatum iste molestiae.', 41, 7, 0, '2018-12-10'),
(123, 'Qui quos cumque quibusdam maiores et et. Numquam qui rerum sit hic ea velit aut quis. Voluptate ut minima quis dolores provident excepturi.', 64, 1, 0, '2018-12-10'),
(124, 'Reiciendis consequuntur impedit quam. Et ipsam sed ut adipisci et et veniam. Deserunt aut voluptas ipsam et non incidunt voluptatibus. Non culpa fugit dolores rem.', 5, 11, 0, '2018-12-10'),
(126, 'Omnis sunt ad eius consequatur. Qui molestiae esse beatae et eveniet veritatis accusamus. Voluptas qui repellat facere omnis aut officia.', 56, 2, 0, '2018-12-10'),
(127, 'Et et eos eos earum. Et molestiae sapiente nisi maxime. Accusamus totam aut est ratione tempora.', 11, 23, 0, '2018-12-10'),
(128, 'Consequatur animi illum et velit maiores aspernatur recusandae. Aliquam nisi deleniti nihil ratione sequi et voluptates. Doloremque consectetur repellat qui minus ad.', 24, 12, 0, '2018-12-10'),
(129, 'Occaecati ipsa quidem nihil molestias a aut est corporis. Minima dignissimos et ratione illo. Aut ratione qui iusto accusamus et nisi.', 41, 12, 0, '2018-12-10'),
(130, 'Sit accusamus voluptatem odit nemo. Eveniet autem debitis voluptas illum est sit omnis. Explicabo ea saepe aperiam ut esse.', 44, 16, 0, '2018-12-10'),
(131, 'In doloribus sed libero quidem voluptatem occaecati itaque. Et repellendus nihil maxime. Dolorem illo vel voluptatum illum officia nesciunt sapiente accusamus. Consequatur delectus ullam et accusamus eos eos sit voluptatum.', 79, 24, 0, '2018-12-10'),
(132, 'Aliquid aliquam ea nobis delectus quia dolorem magnam quia. Similique aliquam autem cupiditate delectus autem. Aliquid maxime impedit sit.', 72, 10, 0, '2018-12-10'),
(133, 'Voluptates quasi ut magnam ut et perspiciatis. Corrupti vitae qui vel. At distinctio ullam nisi nulla atque enim fugiat.', 45, 20, 0, '2018-12-10'),
(134, 'Quaerat officia commodi aut perferendis dignissimos quasi eius dolorum. Aliquam voluptatem est inventore molestias debitis sit maxime autem. Quos dolorem tempora minima dolores dolorem nemo. Laborum soluta ut quos ipsa quasi accusantium.', 61, 13, 0, '2018-12-10'),
(135, 'Molestiae voluptas unde quos labore voluptatum eligendi. Numquam ut aut et quia enim. Possimus corporis corrupti quaerat sunt ea. Quo quos vel quos at labore.', 68, 10, 0, '2018-12-10'),
(136, 'Illum vitae dolorem dolores et laborum maiores. Earum qui qui laboriosam aliquam optio ipsam.', 59, 25, 0, '2018-12-10'),
(137, 'Nam quam illum quod laudantium facere assumenda aut. Consequatur ut voluptas officia nihil omnis fuga provident fugiat. Sunt omnis saepe sunt aliquid enim nemo quasi. Repellat id nobis et velit at rerum.', 76, 10, 0, '2018-12-10'),
(138, 'Eaque doloremque ex accusamus sunt ut accusamus ut deserunt. Tempora autem tempore rerum ut. Iste consequuntur neque autem voluptatem accusantium molestiae velit. Aspernatur aut molestiae et rerum et.', 70, 8, 0, '2018-12-10'),
(139, 'Numquam atque nesciunt molestiae soluta et. Cum veniam accusamus eius voluptate omnis iusto omnis. Reprehenderit aut temporibus soluta at. Aliquid expedita sed maiores voluptatem dignissimos neque ad.', 27, 19, 0, '2018-12-10'),
(140, 'Iste ut adipisci quo deleniti. Nisi est consequuntur autem ducimus. Quos libero nihil sit quia eaque in quia.', 44, 1, 0, '2018-12-10'),
(141, 'Amet officia voluptatum voluptas commodi omnis sed. Quisquam officia dignissimos autem velit. Aliquam ipsa officia autem. Non at quae quae omnis sint non. Sit aut quia nesciunt quia voluptates error eligendi.', 79, 13, 0, '2018-12-10'),
(142, 'Qui dignissimos officiis dolorum similique id. Sed voluptate cum natus facilis. Est blanditiis commodi deleniti repellendus est. Laborum suscipit iste consequatur nisi sit ut iusto soluta.', 60, 7, 0, '2018-12-10'),
(144, 'Deleniti sunt fuga explicabo. Quasi aut eum voluptatum eum aut dicta. Repellat et dignissimos labore quia id molestiae.', 5, 24, 0, '2018-12-10'),
(146, 'Provident reprehenderit repellat et reiciendis ullam. Sit expedita error quaerat eum repellat et amet. Ipsa quas consequatur saepe laboriosam. Voluptates est velit dolor.', 34, 28, 0, '2018-12-10'),
(147, 'Accusantium amet nihil error. Optio nihil occaecati consequatur eos dolores ullam error. Quo nisi id maxime inventore.', 52, 28, 0, '2018-12-10'),
(148, 'Explicabo nesciunt fugiat non temporibus in. Modi et dolores repellat velit temporibus. Suscipit quae ut tenetur excepturi. Occaecati beatae consequatur aut omnis. Iusto est quo placeat adipisci molestiae voluptatem.', 65, 2, 0, '2018-12-10'),
(149, 'Velit et facere omnis aut excepturi pariatur magnam. Commodi explicabo sint sed ut necessitatibus voluptatem. Quia quis rerum quibusdam rem. Sed atque deserunt rerum et rerum.', 35, 15, 0, '2018-12-10'),
(150, 'Et tempora perferendis exercitationem asperiores cum ullam. Fugit est ut nam odit. Dolorem et aut libero quo eveniet necessitatibus est.', 37, 9, 0, '2018-12-10'),
(151, 'Ut aperiam quis vero unde. Rerum fugit nostrum ad sint autem ad veniam. Est totam et tempore sunt deserunt ipsa. Nostrum quibusdam eveniet in iusto.', 72, 4, 0, '2018-12-10'),
(152, 'Pariatur ex aut perferendis at hic maxime et. Officia voluptatem perspiciatis quasi soluta aut. Totam repellendus deleniti temporibus doloribus magnam. Totam accusantium ea debitis consequatur optio velit.', 56, 11, 0, '2018-12-10'),
(153, 'Expedita praesentium assumenda tenetur rem. Ad excepturi quasi molestias iusto est doloremque qui ipsum. Nam vel quidem ea velit qui deserunt.', 60, 20, 0, '2018-12-10'),
(154, 'Rerum eveniet assumenda incidunt quis magni sequi. Accusamus ex voluptatibus ullam dolor optio neque. Repudiandae recusandae vel magnam non.', 70, 8, 0, '2018-12-10'),
(155, 'Eveniet fugit in nisi molestiae quo impedit. Quis enim et nemo aliquam officia. Inventore labore consectetur et architecto autem vel et.', 25, 29, 0, '2018-12-10'),
(156, 'Enim itaque voluptatem laboriosam laboriosam. Qui beatae velit totam distinctio numquam consequatur quaerat nisi. Unde enim ut placeat consequatur.', 52, 29, 0, '2018-12-10'),
(157, 'Provident sint totam recusandae exercitationem laudantium esse libero. Ut pariatur molestias molestiae ipsum eaque. Vitae doloremque perspiciatis aut.', 81, 9, 0, '2018-12-10'),
(158, 'Modi deleniti et reprehenderit. Magnam dolores dolores nemo minima in sapiente eum. Et nostrum ea dolorem. Vel eius expedita quia rerum ipsa non.', 80, 27, 0, '2018-12-10'),
(159, 'Enim consequatur enim dolores earum. Libero qui quia enim aliquam est at at voluptatem. Excepturi expedita dolores consectetur deserunt excepturi alias aspernatur natus. Delectus in nisi possimus optio et.', 42, 20, 0, '2018-12-10'),
(160, 'Eaque cupiditate maxime dolor est voluptatibus unde. Rerum est iure architecto autem omnis. Unde ut veritatis necessitatibus voluptatem cupiditate eveniet pariatur. Repudiandae exercitationem nulla ut quo consequuntur.', 40, 16, 0, '2018-12-10'),
(161, 'Molestiae sit ab et sed itaque aut. Autem velit eius quas ut corrupti asperiores. Officia omnis ea quisquam debitis perspiciatis. Deleniti aut quis expedita.', 10, 25, 0, '2018-12-10'),
(162, 'Reprehenderit nobis rerum nostrum magni eum. Omnis fugit qui perspiciatis autem praesentium debitis et. Vitae nihil quo aut earum consequuntur temporibus quae molestias. Est aspernatur provident magni quam autem reiciendis et.', 44, 25, 0, '2018-12-10'),
(163, 'Illum ut sit hic culpa architecto voluptate dignissimos. Voluptates voluptatem et quia sint. Atque eaque perferendis sint qui expedita. Illum quam eos qui sequi sunt sed.', 66, 23, 0, '2018-12-10'),
(164, 'Laudantium velit optio quo blanditiis praesentium. Necessitatibus neque dolorem qui et nam est molestias. Similique tempore et beatae et voluptatem deleniti nemo. Voluptate asperiores omnis id sint amet eveniet accusantium.', 76, 10, 0, '2018-12-10'),
(165, 'Soluta quisquam sunt sapiente. Praesentium commodi porro in. Et ducimus voluptatem sit qui odit cumque. Expedita impedit velit esse dolore ab reiciendis. Asperiores debitis sit voluptatum culpa sed alias.', 36, 4, 0, '2018-12-10'),
(167, 'Quos soluta corrupti voluptas numquam. Molestiae id est accusamus totam nemo eius. Autem sint repellat qui illum vitae minima praesentium. Voluptatem eum harum et.', 43, 16, 0, '2018-12-10'),
(168, 'Facere et voluptate eos velit accusantium ratione. Quis sapiente id numquam dignissimos unde. Doloribus rerum quibusdam reiciendis voluptatem deserunt atque sunt.', 79, 10, 0, '2018-12-10'),
(169, 'Veritatis quisquam aut est hic sapiente quis voluptas. Soluta ut similique libero quaerat. Et nobis aliquid neque aut.', 34, 11, 0, '2018-12-10'),
(170, 'Aliquid ullam iure eligendi voluptatum amet et sit. Est ad qui rerum dolores accusamus qui. Harum deserunt quae ipsa aliquam saepe.', 76, 6, 0, '2018-12-10'),
(171, 'Velit aut porro eum nesciunt quia consequatur aut fuga. Qui illum ut quibusdam veritatis unde. Sed a voluptatem consequuntur qui et. Architecto odit et velit explicabo doloribus omnis numquam.', 31, 12, 0, '2018-12-10'),
(173, 'Iure consectetur dignissimos est quos in aut. Repellendus aliquam consequatur ut qui modi numquam.', 40, 5, 0, '2018-12-10'),
(174, 'Dignissimos ut beatae ut. Veniam fugiat voluptatum a tempora. Magnam autem omnis molestias. Quae cumque consequatur et rem dolore sit ipsa.', 56, 14, 0, '2018-12-10'),
(176, 'Laborum est recusandae consequatur esse voluptatem alias. Tenetur accusamus sapiente dolores natus occaecati quia.', 37, 12, 0, '2018-12-10'),
(177, 'Voluptas aut quia et ipsa. Magnam architecto et accusamus quia est expedita. Excepturi deleniti animi quam incidunt veritatis iure dolor.', 44, 23, 0, '2018-12-10'),
(178, 'Iure qui nihil repellendus recusandae eligendi magnam voluptatem repellendus. Aut mollitia id aut cum. Asperiores vero quibusdam voluptates culpa est. Voluptatum et ipsa omnis delectus voluptatum ut consectetur minima.', 36, 29, 0, '2018-12-10'),
(179, 'Quibusdam et nostrum in et distinctio et mollitia. Id molestiae facilis perspiciatis voluptas et et quo. Tenetur ratione dolorem facilis voluptatem velit. Asperiores dolor est deserunt aut aut. Non dicta perspiciatis et est quia.', 72, 29, 0, '2018-12-10'),
(180, 'Iusto ut ipsa odio. Maiores nemo velit eos eveniet iure dolore delectus natus. Nulla natus est consequatur ut.', 79, 2, 0, '2018-12-10'),
(181, 'Eius dolore harum et ullam velit atque voluptatum. Itaque quo excepturi voluptate qui molestiae. Libero et debitis tenetur eos odio autem eos.', 67, 22, 0, '2018-12-10'),
(182, 'Quia sint nesciunt consequatur doloribus quaerat architecto. Eum quis distinctio et est error et ad sunt. Suscipit similique accusantium vero et odit voluptatem. Temporibus animi alias sed aliquid aperiam quod ducimus voluptatem. Blanditiis dignissimos sapiente laudantium dolore ab quidem.', 42, 12, 0, '2018-12-10'),
(183, 'Quod ut nobis est eos neque qui. Accusantium velit laudantium earum necessitatibus beatae. Id adipisci quia incidunt dolore suscipit. At dolorem necessitatibus expedita est qui.', 54, 12, 0, '2018-12-10'),
(184, 'Sunt rerum repellat est perspiciatis est doloribus nisi laboriosam. Qui ipsa alias eaque numquam rerum unde voluptas ea. Modi quia laboriosam incidunt beatae qui autem officiis. Provident facilis fuga et.', 50, 10, 0, '2018-12-10'),
(185, 'Voluptatum voluptatem saepe recusandae voluptatibus. Odio quo quia omnis consequuntur officia ratione quos. Ipsum culpa voluptate necessitatibus modi sint. Est iure quis quaerat numquam.', 53, 17, 0, '2018-12-10'),
(186, 'Aspernatur fuga exercitationem et fugit consequatur quas. Architecto minus molestiae ab qui voluptatem.', 65, 2, 0, '2018-12-10'),
(187, 'Deserunt ut dolor maxime magni exercitationem. Accusantium fugit optio aliquid laudantium illo consectetur delectus. Accusamus debitis cumque et omnis.', 59, 26, 0, '2018-12-10'),
(188, 'Velit deserunt assumenda est inventore odio praesentium a iste. Fuga labore modi maxime quam dolorum id ut voluptatem. Quae iusto reiciendis at ullam sint similique. Voluptatem illo aut voluptatibus nemo ad.', 25, 29, 0, '2018-12-10'),
(189, 'Rerum voluptatem accusamus non veritatis eveniet alias sit. Voluptatem consectetur qui et consequatur. Similique sed inventore explicabo est sed quis reprehenderit cupiditate. Beatae corporis saepe expedita molestiae impedit sunt consequatur ipsum.', 56, 30, 0, '2018-12-10'),
(190, 'Enim harum facere voluptatum velit a et. Beatae officia iure possimus. Vitae provident et ipsam. Commodi quo et sint dolorem et rem veniam.', 38, 12, 0, '2018-12-10'),
(192, 'Nesciunt odit quo ut. Placeat qui a deserunt laborum perspiciatis. Voluptate consequatur consequuntur alias iure ut qui.', 45, 28, 0, '2018-12-10'),
(193, 'Totam ut nihil eveniet sunt. Mollitia nihil doloremque aliquam iure aliquid ut molestiae. Cumque quia sunt possimus explicabo hic earum. Suscipit exercitationem rem facilis aut at autem placeat. Voluptatem ea at autem commodi.', 42, 12, 0, '2018-12-10'),
(194, 'Non impedit debitis ut repellat. Perferendis ipsum sit error corporis qui. Et qui quia et eum.', 34, 12, 0, '2018-12-10'),
(195, 'Dicta beatae id saepe. Assumenda repudiandae ducimus voluptatem accusantium. Nihil aut mollitia minus sapiente molestiae ut. Tempora cupiditate sapiente voluptatem eius maiores odit.', 65, 18, 0, '2018-12-10'),
(196, 'Quos ratione corporis enim architecto. Repudiandae consequuntur molestiae corrupti exercitationem consequatur ab. Doloremque aut est et qui fugiat ut quam. Nam cum nemo quia est ut placeat.', 14, 8, 0, '2018-12-10'),
(197, 'Est error non et error corporis reiciendis reiciendis. Unde et voluptatem non natus.', 49, 26, 0, '2018-12-10'),
(198, 'Dolor ut nemo nostrum vitae quidem sit. Autem sapiente ad et aliquam. Porro rem quia dicta numquam id.', 43, 26, 0, '2018-12-10'),
(199, 'Aliquam aut laudantium rerum eum. Excepturi dolor nisi placeat voluptatem odio eos.', 15, 13, 0, '2018-12-10'),
(200, 'Perferendis eum fugit accusamus vero. Asperiores molestias aut maxime dicta animi magnam aut. Quibusdam vel molestiae quaerat facere id est dolorem. Id recusandae nihil qui.', 75, 23, 0, '2018-12-10'),
(201, 'Molestias praesentium et harum nesciunt. Excepturi vitae quam incidunt at et architecto dignissimos exercitationem. Illo animi quia et. Dolor omnis esse aliquid voluptate veritatis ipsa numquam.', 76, 30, 0, '2018-12-10'),
(202, 'Atque sequi voluptatibus sint voluptas. Autem ipsa voluptas alias voluptas laborum laudantium. Quis earum alias quas repellat velit eius.', 11, 20, 0, '2018-12-10'),
(203, 'Minus et et et necessitatibus doloribus dicta. In architecto itaque est ut nobis ut voluptatem. Voluptatem iure quia est. Natus corrupti consequuntur repellat et unde id quis. Perferendis quidem tempora neque error nisi.', 36, 25, 0, '2018-12-10'),
(204, 'Iusto accusamus id nostrum vitae deleniti aliquid excepturi voluptatem. Aut et suscipit possimus ipsum sit. Ducimus sed et illum eveniet. Animi odio aut reprehenderit harum excepturi aut ea libero.', 67, 22, 0, '2018-12-10'),
(205, 'Ut ut dolores eligendi labore voluptatibus est. Consequatur repellendus voluptatem consectetur ut modi. Est qui est odit architecto.', 61, 21, 0, '2018-12-10'),
(206, 'Blanditiis similique veniam iste. Aut ullam nostrum nihil quibusdam iure. Voluptate maiores vel voluptas voluptates ipsum saepe quia. Nulla velit ut incidunt distinctio pariatur nemo.', 65, 16, 0, '2018-12-10'),
(207, 'Porro quo beatae aut doloribus non quos. Exercitationem accusamus eius impedit tempore vel doloremque. Dolore quam nemo esse quia aperiam. Facere placeat similique aspernatur odio voluptas porro delectus aspernatur. Non quasi dolorem doloribus distinctio quia tempora quaerat suscipit.', 42, 25, 0, '2018-12-10'),
(208, 'Non recusandae autem quisquam alias. Rem rem recusandae necessitatibus tempora incidunt sunt tempore. Ut odio eligendi recusandae similique dolore laboriosam inventore hic.', 52, 9, 0, '2018-12-10'),
(209, 'Aut officia sunt inventore eos. Accusantium adipisci omnis omnis quia totam. Ipsa ullam impedit id voluptates ut excepturi delectus excepturi. Laudantium quam veniam tempore numquam.', 5, 26, 0, '2018-12-10'),
(210, 'Enim eaque esse qui iure accusamus nobis. Qui voluptas occaecati unde est. Mollitia esse et dolor dicta consequatur quia et. Sit aut nisi quo quia ab.', 35, 17, 0, '2018-12-10'),
(211, 'Magni ut ducimus rerum saepe vel minus repudiandae. Excepturi voluptas id voluptatem dolores veniam vero. Non eveniet magni molestiae ratione odit.', 44, 29, 0, '2018-12-10'),
(212, 'Sint ipsum qui itaque laboriosam. Sit voluptatem cum omnis voluptatem. Id ipsam quo quas saepe quos ut. Quia id consequatur vitae explicabo qui et. Sint dolor autem aspernatur explicabo ut ipsum ut.', 50, 29, 0, '2018-12-10'),
(213, 'Corporis quod quis sit aliquid reprehenderit. Unde eveniet enim fugiat quia sunt alias. Sit nihil aliquam vel dolores beatae corrupti.', 44, 10, 0, '2018-12-10'),
(214, 'Et dolorem quam enim totam aut consequatur. Sed cumque provident non quae nesciunt. Cum et repellendus at fugit odit fugit consequatur voluptatem. Aut dignissimos unde debitis inventore.', 35, 7, 0, '2018-12-10'),
(215, 'Eos similique harum sapiente rerum ut et quo. Aut veritatis distinctio eos labore nisi.', 57, 21, 0, '2018-12-10'),
(216, 'Dolores neque corrupti consequatur nesciunt aliquid. Sit in illo ut ab quos impedit illo. Et expedita qui dolor aut blanditiis. Culpa consectetur autem officiis blanditiis velit.', 15, 29, 0, '2018-12-10'),
(217, 'Qui et omnis expedita aspernatur non explicabo ea. Quod nulla consequatur sed mollitia. Dolorem earum consequatur voluptates quia veritatis perspiciatis.', 42, 23, 0, '2018-12-10'),
(218, 'Sunt cumque qui repudiandae sed dolores nihil molestiae. In quo quod sint tenetur molestiae eos unde. Et expedita est autem voluptatem cum laborum.', 51, 3, 0, '2018-12-10'),
(220, 'Eligendi quod id nisi culpa nihil harum sapiente perspiciatis. Ipsam sunt sequi assumenda tempore molestiae. Sed dolor dolorem fugiat.', 13, 22, 0, '2018-12-10'),
(221, 'Est maiores nulla est. Mollitia pariatur odit velit quibusdam non. Voluptatum laudantium perspiciatis et. Aliquid voluptatem non minus illum vitae eum.', 31, 12, 0, '2018-12-10'),
(223, 'Labore rem nemo natus et. Dolor sapiente et veritatis voluptatem numquam suscipit aut iste. Sint beatae exercitationem officia qui distinctio voluptatum.', 31, 30, 0, '2018-12-10'),
(224, 'Tempora molestiae eum odit dignissimos expedita ullam id. Quis ut voluptatem molestias numquam laborum qui corporis. Eum nesciunt et beatae odio non labore ea.', 14, 4, 0, '2018-12-10'),
(225, 'Occaecati dolore quasi sint molestiae impedit quis. Ut porro doloribus reprehenderit et. Eos aut magnam eveniet quos officiis nemo.', 11, 23, 0, '2018-12-10'),
(226, 'Necessitatibus consequuntur quia quas delectus. Consequatur laborum numquam nesciunt ut.', 44, 10, 0, '2018-12-10'),
(227, 'Consequatur quo in in. Pariatur repellat ut possimus culpa magni repellat voluptatibus.', 71, 14, 0, '2018-12-10'),
(228, 'Blanditiis dolorem qui necessitatibus at. Aut excepturi iusto ut qui. Repellendus aliquam dolor quae nihil totam molestiae excepturi consequatur. Vel et magni recusandae et voluptate.', 31, 23, 0, '2018-12-10'),
(229, 'Inventore quam praesentium ea necessitatibus autem dolores. Necessitatibus quam facilis et laboriosam sit aut.', 27, 9, 0, '2018-12-10'),
(230, 'Laborum laudantium eaque cum ducimus. Assumenda dignissimos dolores itaque id et ut. Aut optio quos omnis ipsa reprehenderit. Sit earum magnam in ipsum.', 66, 10, 0, '2018-12-10'),
(231, 'Error laudantium eum suscipit facere rerum possimus voluptatem iusto. Eum totam ab aut fugiat. Est quo ex ratione neque labore odio veniam architecto.', 77, 1, 0, '2018-12-10'),
(232, 'Asperiores nobis dignissimos natus id esse. Voluptatem molestias veniam delectus debitis. Optio accusamus veniam qui facere et corrupti deserunt. Esse sint nihil eos provident consequatur qui.', 52, 29, 0, '2018-12-10'),
(233, 'Corrupti maxime ut deserunt. Nesciunt est non accusamus unde inventore fuga voluptatibus. Ut error placeat magnam qui animi.', 62, 8, 0, '2018-12-10'),
(234, 'Quae inventore similique non ad qui sunt. Sit corporis a autem consequuntur quisquam placeat voluptas.', 11, 11, 0, '2018-12-10'),
(235, 'Dolores occaecati dolores sed repudiandae reprehenderit suscipit omnis rerum. Id aperiam officiis fuga quas ea necessitatibus. Commodi ut quia id sunt.', 51, 20, 0, '2018-12-10'),
(236, 'Possimus cum natus nulla optio. Est iure qui vitae ullam sed. Dicta dicta quo quo aut qui.', 71, 29, 0, '2018-12-10'),
(238, 'Molestias non sit aliquam dolor. Maiores numquam culpa sunt ipsa et quia ut fugiat.', 69, 29, 0, '2018-12-10'),
(239, 'Eveniet doloremque asperiores voluptatibus eos deleniti saepe. Incidunt eos voluptas et aut est ipsam quia.', 42, 14, 0, '2018-12-10'),
(240, 'Quis quod exercitationem odit dolor magni. Quia est id dicta iste beatae. Quasi facere natus voluptas doloribus et exercitationem ut porro. Quis itaque quia molestiae quaerat.', 41, 14, 0, '2018-12-10'),
(241, 'A enim esse porro voluptas numquam delectus eligendi sed. Voluptas consequatur temporibus sed. Fugiat dolorem maxime dignissimos accusamus ea.', 47, 17, 0, '2018-12-10'),
(242, 'Rerum excepturi enim repellat earum. Omnis corporis eveniet eligendi saepe quo quod.', 76, 5, 0, '2018-12-10'),
(243, 'Non nemo nesciunt possimus ex architecto earum rerum quia. Nisi in enim pariatur vel distinctio. Officiis quam consectetur perspiciatis nobis similique.', 78, 8, 0, '2018-12-10'),
(244, 'Qui quis non quisquam quia facere fuga qui. Distinctio quia non qui ut. Deserunt temporibus ut dignissimos. Ut maiores voluptate quisquam.', 69, 11, 0, '2018-12-10'),
(245, 'Officia sint rem dolorem excepturi ut. Laudantium reiciendis fugit aliquid a in quidem exercitationem. Et sit nemo doloremque. Est est eum voluptas saepe.', 36, 8, 0, '2018-12-10'),
(246, 'Tenetur ullam modi laboriosam aut rerum incidunt. Suscipit quo necessitatibus ut enim. Repudiandae placeat qui vel enim aliquid beatae assumenda ut. Sed quod atque magni facilis aspernatur ipsa.', 64, 2, 0, '2018-12-10'),
(247, 'Repudiandae aut distinctio qui inventore. Delectus corporis quia sint aliquid illum molestias. Quae reiciendis facilis natus sed consequatur et.', 41, 16, 0, '2018-12-10'),
(248, 'Necessitatibus labore voluptatem voluptatum ut. Quo voluptatem sequi amet tenetur. Exercitationem fuga esse eos distinctio reiciendis libero incidunt. At alias voluptatibus officiis ut sint est.', 58, 20, 0, '2018-12-10'),
(249, 'Est aperiam ipsa harum culpa in ut. Fuga ea laudantium ut. Fugit ut id dolores omnis dolor eligendi consectetur. Sit iusto nobis corporis nam eveniet animi.', 46, 14, 0, '2018-12-10'),
(250, 'Nihil asperiores esse praesentium sint eveniet. Veritatis eum ea quia. Autem rem dolores laborum commodi pariatur voluptatem dignissimos.', 40, 11, 0, '2018-12-10'),
(251, 'Ut reprehenderit excepturi rerum est animi et corporis eligendi. Quas voluptate sit sequi ab. Veritatis omnis nostrum accusamus dolore. Molestiae nihil ullam minima error possimus est.', 6, 25, 0, '2018-12-10'),
(252, 'Eius voluptas error libero dolores. Veniam qui molestiae in sit vel minima aut. Nisi quis sed consectetur rerum soluta.', 13, 12, 0, '2018-12-10'),
(253, 'Eum earum enim facilis est sequi reprehenderit. Nihil et cum placeat sequi dicta reprehenderit voluptas nemo. Hic est recusandae eaque tenetur vitae alias.', 40, 20, 0, '2018-12-10'),
(254, 'Est officiis sapiente fuga saepe sed. In sunt repellendus eum optio pariatur in est. Quia ut corrupti qui ipsam porro alias. Nostrum aut explicabo molestias cupiditate iusto. Et impedit neque odio iusto porro veniam id.', 24, 21, 0, '2018-12-10'),
(255, 'Temporibus exercitationem laboriosam consequatur aut nobis numquam. Porro autem sed sunt omnis quia id. Fuga ex ut tempore et quia corporis unde. Dolorem neque ea temporibus aut.', 61, 18, 0, '2018-12-10'),
(256, 'Porro ea ut mollitia nam animi. Voluptatem voluptatem ducimus et dolorem dolorem voluptatum facilis. Labore molestias ut similique facere voluptatem voluptatum.', 69, 23, 0, '2018-12-10'),
(257, 'Itaque maxime rerum quis et et nemo. Illo modi et aut a suscipit necessitatibus. Dolores ex nostrum ut ea accusamus. Nesciunt laboriosam esse saepe reprehenderit laborum maiores. Amet debitis pariatur et sed.', 62, 26, 0, '2018-12-10'),
(258, 'Dolore dolore corrupti quas. Et laboriosam officiis asperiores perferendis hic asperiores. Possimus sit iure iusto unde.', 12, 25, 0, '2018-12-10'),
(259, 'Sunt quod voluptas et asperiores sed maxime. Occaecati libero maiores iste quo nostrum. Modi qui magnam officia molestias vel. Eaque ab maiores ullam illo sint illum quae asperiores.', 47, 25, 0, '2018-12-10'),
(260, 'Occaecati ut libero dignissimos omnis ipsum. Numquam labore at eos et aliquam iusto. Suscipit nulla ut laborum et quod cupiditate.', 51, 19, 0, '2018-12-10'),
(261, 'Neque officia dolorem libero fugit nesciunt. Natus blanditiis magnam dolor ratione voluptatem sunt qui. Quia eum doloribus perspiciatis odio veniam non. Ut ipsa quia fuga dignissimos.', 36, 3, 0, '2018-12-10'),
(262, 'Voluptates facere totam sed impedit ab. Ut fugiat at temporibus et ipsa distinctio. Iusto fugiat quod nostrum repudiandae quia accusamus dicta animi.', 59, 27, 0, '2018-12-10'),
(263, 'Omnis alias iure qui omnis. Assumenda quo similique dolorum tempora sapiente. Repellendus sit iste et labore.', 6, 4, 0, '2018-12-10'),
(265, 'Accusamus sint reiciendis est non culpa. Qui vel ut placeat sunt qui. Facere at est et aut vel. Omnis dolores ut voluptatem dignissimos est cumque.', 53, 7, 0, '2018-12-10'),
(266, 'Et nihil porro aut ex. Quia iusto sed est deserunt culpa. Quia qui iure sapiente. Repellendus architecto eius temporibus doloremque quisquam at nisi.', 27, 7, 0, '2018-12-10'),
(267, 'Dolore quos ipsa amet et ipsa pariatur. Corrupti et adipisci neque in aut atque. Ad non sed voluptas consequatur velit et voluptatem ea. Magnam consequatur cumque excepturi illum.', 64, 7, 0, '2018-12-10'),
(268, 'Iusto sit asperiores aut mollitia et sapiente. Consequatur quae id qui corporis dolorem inventore sint. Nulla omnis sit cum qui hic id. Est necessitatibus qui quo rerum corporis tempora enim. Repellendus recusandae vero vel et nemo debitis quasi.', 40, 17, 0, '2018-12-10'),
(269, 'Ipsum quasi maiores vel error. Aut ipsum officia culpa ipsum voluptas illum repellat et. Quam perspiciatis inventore provident incidunt assumenda dolor quam odit. Quia rem vero nulla voluptas.', 36, 23, 0, '2018-12-10'),
(270, 'Natus dolores optio accusamus. Ipsam inventore consectetur maiores architecto vero qui voluptatem. Omnis error ea et et dolorum doloribus amet.', 11, 19, 0, '2018-12-10'),
(271, 'Et impedit velit aperiam et hic. Earum aliquid placeat est vel voluptatum iste est reprehenderit. Quis doloribus animi blanditiis sit dolor dignissimos.', 24, 5, 0, '2018-12-10'),
(272, 'Fuga ipsum libero voluptates animi. Harum et eaque eum error repellendus.', 50, 6, 0, '2018-12-10'),
(273, 'Sunt iusto cupiditate consequatur inventore ut. Atque inventore ut odit quasi et. Vel et facilis nihil magni.', 59, 25, 0, '2018-12-10'),
(275, 'Eius fugit vitae consectetur. Illo debitis molestiae necessitatibus. Voluptates quibusdam iste cupiditate veritatis incidunt. Ipsa voluptatum sit qui qui autem.', 27, 29, 0, '2018-12-10'),
(276, 'Dignissimos enim necessitatibus quia facere illo aperiam. Dolor omnis minus et illum ut non. Eos et dolor saepe aut odio ut. Consequatur adipisci qui doloremque nisi cumque delectus quia.', 25, 9, 0, '2018-12-10'),
(277, 'Ex porro facilis reprehenderit possimus consequatur fuga ratione. Impedit expedita explicabo ipsum earum eos quis. Explicabo laudantium saepe ut assumenda a reprehenderit accusantium. Ut ex velit ullam consequuntur animi. Nemo ea porro atque est neque molestiae.', 81, 25, 0, '2018-12-10'),
(278, 'Aut fuga facere officiis nisi. Quis quod molestiae ad. Nobis atque omnis non. Ut est minus odio est accusamus atque fugit.', 62, 9, 0, '2018-12-10'),
(279, 'Non vitae temporibus sunt ab reiciendis laudantium molestias. Cum qui magnam occaecati iusto inventore excepturi. Autem rerum id tenetur commodi doloribus sed nemo. Atque at neque deleniti minima.', 35, 22, 0, '2018-12-10'),
(280, 'Odio nemo corrupti harum et aut accusamus. Alias recusandae pariatur omnis incidunt enim in.', 13, 19, 0, '2018-12-10'),
(281, 'Architecto minus enim enim dolorem corporis. Inventore eum molestias earum aut eum doloribus doloremque. Vitae laudantium in quam aut quaerat deleniti sit vero.', 68, 28, 0, '2018-12-10'),
(282, 'Quasi est aspernatur non quia qui qui esse illum. Impedit adipisci harum ipsa illum sunt iusto. Dolor saepe ut amet sint et sit eum. Nobis aut dignissimos sint ullam aut porro. Dolores velit et id sunt et.', 79, 28, 0, '2018-12-10'),
(283, 'Qui exercitationem porro quidem dolores. Temporibus illo nisi blanditiis modi et. Dignissimos sed odit hic aliquam corrupti officiis. Ut voluptatibus quia quo officiis doloremque magnam eius.', 73, 20, 0, '2018-12-10'),
(284, 'Odio ut officia consequatur id vero aliquid. Dignissimos corrupti ipsa dolore aut voluptatem.', 58, 10, 0, '2018-12-10'),
(285, 'Omnis et consequatur debitis quod. Sunt sunt itaque ab praesentium distinctio. Molestiae cumque ipsa optio et fuga.', 67, 14, 0, '2018-12-10'),
(286, 'Unde placeat optio dolor. Eaque iure porro non porro soluta deserunt ea ipsa. Dolor soluta eum esse quod. Amet sed nam est molestiae cum est sit.', 48, 3, 0, '2018-12-10'),
(287, 'Veniam ipsam alias ipsum est. Dolor aut aut fuga laboriosam animi id. Sint ullam quo reprehenderit voluptates esse ea omnis aut.', 51, 27, 0, '2018-12-10'),
(288, 'Excepturi impedit praesentium exercitationem voluptatum ut. Et sit libero neque placeat omnis. Perferendis aperiam aperiam itaque deserunt.', 73, 26, 0, '2018-12-10'),
(289, 'Dolor maiores enim delectus soluta illo quis. Autem ipsam non enim dolore reprehenderit voluptatem. Et sit voluptatum maiores et architecto neque omnis.', 39, 27, 0, '2018-12-10'),
(290, 'Sequi ut dolorem doloribus fugit est consequatur facere. Et magni omnis dolorem quasi nemo laboriosam.', 49, 30, 0, '2018-12-10'),
(291, 'Qui tempore occaecati excepturi voluptas quia qui ut. Nemo corrupti adipisci est officiis quia distinctio ea. Molestiae doloribus aliquid fuga tempore debitis.', 44, 21, 0, '2018-12-10'),
(292, 'Et perspiciatis ad aut consequuntur. Corporis rerum ipsa quis quia ea quod.', 73, 15, 0, '2018-12-10'),
(293, 'Fugit libero in est suscipit harum molestiae. Et molestias aut sit molestiae. Commodi id blanditiis fugit recusandae debitis et.', 10, 5, 0, '2018-12-10'),
(294, 'Similique culpa voluptas et deserunt voluptates facere. Suscipit assumenda aut nulla doloribus blanditiis nihil qui quasi. Velit omnis earum provident.', 34, 7, 0, '2018-12-10'),
(295, 'Reiciendis illo ut eaque quidem. Sunt iure accusantium officia reprehenderit tenetur. Ut neque pariatur sit.', 49, 24, 0, '2018-12-10'),
(296, 'Qui accusamus ad et aut et earum iure iste. Harum ea sed dolore modi. Vitae ut sint provident provident atque eum aut. Recusandae odio est qui debitis.', 65, 22, 0, '2018-12-10'),
(297, 'Maxime doloremque et tempora inventore. Quas adipisci perferendis quia ab reprehenderit accusantium. Ipsa atque atque explicabo quis est et aut. Id deserunt iusto aut quaerat voluptatem.', 10, 8, 0, '2018-12-10'),
(298, 'Minima quo quibusdam nemo rerum itaque. Iste est et occaecati ducimus eos. Ducimus aut rerum neque rerum voluptatem consectetur et dolorum.', 43, 15, 0, '2018-12-10'),
(299, 'Incidunt voluptatem sit voluptatem eveniet consequatur veritatis. Ipsam et dolore voluptatum omnis sequi nobis nam. Voluptatem mollitia enim nostrum illum officiis explicabo.', 73, 15, 0, '2018-12-10'),
(300, 'Eligendi quia quam aut rem quaerat inventore amet. Sed id accusamus deleniti quis placeat. Amet rerum aperiam dicta alias sed aut. Ea aut sapiente aut.', 65, 27, 0, '2018-12-10'),
(301, 'Autem amet sed quas velit officiis qui. Quia velit quibusdam quia numquam suscipit sed. Odio magnam modi et aliquam necessitatibus ullam blanditiis quia. Error ut est sunt enim magni quaerat.', 15, 25, 0, '2018-12-10'),
(302, 'Ratione architecto exercitationem maiores optio sint qui enim. In et inventore quae illum beatae et dolore quia. Recusandae odit recusandae et. Placeat in esse a ab.', 67, 16, 0, '2018-12-10'),
(303, 'Fugit accusamus sint voluptatem reprehenderit et amet tenetur molestiae. Reprehenderit eligendi odit ullam ea dolorem et. Ut earum reprehenderit ut natus quidem quod occaecati. Aut quis totam aut sequi.', 62, 1, 0, '2018-12-10'),
(304, 'Deleniti fuga asperiores enim sunt sed aliquid. Porro vero voluptas impedit et ducimus. Quia placeat voluptatibus consequuntur ipsam. Ipsa ut doloremque et occaecati est et.', 60, 1, 0, '2018-12-10'),
(305, 'Praesentium non occaecati voluptatem earum aut. Suscipit ex omnis rerum est. Dolore alias magni sed. Praesentium quia quis illo temporibus commodi.', 33, 30, 0, '2018-12-10'),
(306, 'Nesciunt tempore unde ad quisquam esse in voluptatem. At ut cumque suscipit ipsam aliquam rem. Et nobis dolores officia commodi excepturi.', 50, 1, 0, '2018-12-10'),
(307, 'Voluptatem nostrum amet labore consequuntur rerum. Suscipit vitae ducimus quas vitae excepturi. Quasi sit veniam rerum qui vero. Est rem explicabo doloremque et.', 45, 9, 0, '2018-12-10'),
(308, 'Qui architecto explicabo impedit possimus odit mollitia. Quidem itaque dolor earum voluptates. Iste quaerat dolores nihil quam rerum delectus qui occaecati. Corrupti saepe voluptate voluptatibus perspiciatis necessitatibus consectetur.', 51, 16, 0, '2018-12-10'),
(309, 'Sint alias est sit quo at culpa et. Velit commodi omnis modi nostrum qui voluptatum harum non. Perferendis molestias distinctio quibusdam nihil et et. Ullam accusantium sed rerum pariatur.', 35, 4, 0, '2018-12-10'),
(310, 'Voluptatem et ipsa voluptas necessitatibus ratione. Recusandae voluptatem eos est. Deleniti aut dicta inventore est ea quam quas.', 37, 13, 0, '2018-12-10'),
(311, 'Culpa odio necessitatibus assumenda et. Consequatur aliquid sed sed amet. Explicabo esse optio veniam quis et. Rerum est harum neque nam animi et.', 36, 25, 0, '2018-12-10'),
(312, 'Tenetur ex sed dolorum qui. Qui praesentium praesentium repellendus consequatur accusantium. Ut quibusdam et perferendis illo minus qui beatae est. Sit quia eaque reprehenderit adipisci qui.', 62, 18, 0, '2018-12-10'),
(313, 'Nisi minus amet quia sequi tempore error praesentium. Quo rem laborum cupiditate necessitatibus. Explicabo fugit ut voluptate qui non harum. Voluptas nisi qui modi at.', 10, 8, 0, '2018-12-10'),
(314, 'Pariatur qui et eveniet non ea. Est libero illo odio non magni est. Magnam autem voluptates facilis cupiditate unde.', 12, 22, 0, '2018-12-10'),
(315, 'Qui cumque in cumque quasi aut. Et delectus quas inventore aut soluta ratione dolorem. Iusto sit eum veritatis dignissimos dolorum vero. Veniam sunt amet deserunt animi non et.', 66, 21, 0, '2018-12-10'),
(317, 'Eveniet impedit et et at beatae inventore consequatur. Dolorem est non voluptas voluptate omnis fuga sint. Odio temporibus culpa libero voluptatem.', 39, 11, 0, '2018-12-10'),
(318, 'Omnis omnis excepturi quisquam aspernatur est hic. Corporis ea nulla facilis ut sit voluptate. Error voluptate rerum occaecati deserunt voluptatibus qui. Id mollitia sed sed unde distinctio rerum.', 64, 2, 0, '2018-12-10'),
(320, 'Error mollitia exercitationem eaque commodi placeat. Ullam et nihil inventore dicta eaque omnis.', 46, 17, 0, '2018-12-10'),
(321, 'Occaecati et ab nostrum quidem impedit doloremque. Dolorem odio et recusandae amet natus. Nesciunt placeat quidem illo et.', 76, 21, 0, '2018-12-10'),
(322, 'Quam numquam occaecati ab nihil qui ducimus autem. Tempore cumque vel aut facere. Blanditiis qui sed provident laboriosam autem tempora.', 24, 4, 0, '2018-12-10'),
(323, 'Enim quia expedita minima totam. Sint voluptatem nobis qui officiis facilis nam aut. Quia eius cupiditate eos saepe. Eaque commodi dicta doloribus non dolorum quia dolorem.', 76, 30, 0, '2018-12-10'),
(324, 'Nemo impedit nobis ut qui porro. Placeat fugit qui aut nobis. Quia minima sunt voluptates et molestiae. Eveniet illo in expedita.', 46, 1, 0, '2018-12-10'),
(325, 'Rem dolorem voluptatibus ullam neque quasi omnis. Molestiae ut nesciunt officia dolorem autem. Accusamus facilis sed itaque inventore. Laudantium veniam id tempore dolor.', 58, 10, 0, '2018-12-10'),
(326, 'Praesentium quia molestiae minima. Saepe nobis cum dignissimos autem. Similique magnam iure id dicta sint voluptatem libero.', 46, 6, 0, '2018-12-10'),
(327, 'Consequatur ratione consequuntur odio itaque officia inventore vel. Voluptatum laborum sunt sed voluptatem est expedita. Earum ex veniam ipsum natus adipisci iste quis. Repudiandae non quia optio mollitia.', 35, 30, 0, '2018-12-10'),
(328, 'In praesentium vitae deleniti iure necessitatibus quas pariatur. Ut accusantium et illo maxime error.', 14, 6, 0, '2018-12-10'),
(329, 'Consequuntur placeat eveniet minus aut. Rerum quam laudantium sint quos temporibus rerum ipsum consequatur. Dignissimos fugiat qui voluptatem quos. Quidem sint laboriosam tenetur ratione reiciendis ea. Inventore quidem veniam omnis.', 67, 25, 0, '2018-12-10'),
(330, 'Consectetur vero reiciendis ipsa ut doloribus consequatur quisquam. Eum esse ab cum dolorem. Enim praesentium vero illum in et non rerum.', 46, 4, 0, '2018-12-10'),
(331, 'Officiis et asperiores qui odit dolorum dolorem. Autem blanditiis ut vero quaerat qui asperiores impedit. Est non commodi numquam velit et ex. Occaecati maiores dolorem ea voluptates.', 68, 4, 0, '2018-12-10'),
(332, 'Eum qui autem et consequatur. Neque vel in maiores sit saepe. Quisquam nulla officiis atque quia.', 62, 30, 0, '2018-12-10'),
(333, 'Odio optio ea dicta sed dignissimos. Culpa iusto aut illo sequi sequi dolorem. Laborum qui autem sequi voluptatibus iste amet. Repellat voluptates vel nihil.', 58, 15, 0, '2018-12-10'),
(334, 'Deleniti omnis odit ut debitis laudantium vel dolor facilis. Et molestiae voluptatem sint cupiditate necessitatibus architecto. Pariatur ut veniam et ipsum minus et occaecati reprehenderit. Ut omnis suscipit fugiat placeat.', 65, 1, 0, '2018-12-10'),
(335, 'Ut laudantium rem optio deserunt repellat. Sunt ut ea unde repudiandae quo tempora dolore. Quo sed et modi rem voluptatem.', 24, 5, 0, '2018-12-10'),
(336, 'Quo assumenda et magni ratione in similique architecto. Aut minima ea libero qui. Doloremque quam quo saepe ea impedit.', 48, 6, 0, '2018-12-10'),
(337, 'Molestias consequatur adipisci eos velit qui quia. Veritatis est magnam iste nemo deserunt. Vel et eveniet suscipit ut.', 47, 21, 0, '2018-12-10'),
(338, 'Et vel blanditiis et maiores rerum excepturi ut. Quia quia a eos voluptatem tempora et. Reprehenderit aut ratione excepturi omnis earum. Non voluptatem ipsum saepe id ex modi. Possimus occaecati cumque repellat voluptatum.', 41, 25, 0, '2018-12-10'),
(339, 'Qui placeat vitae ut eos vel qui qui qui. Et nobis quisquam vero ullam. Dignissimos beatae odit ex aspernatur.', 70, 16, 0, '2018-12-10'),
(340, 'Est non ducimus velit rerum voluptatem. Quas doloremque ut incidunt vel pariatur eius. Qui recusandae consequatur tempore.', 12, 3, 0, '2018-12-10'),
(341, 'Aut delectus tenetur quae quas quam eum sint quod. Delectus non accusamus accusantium aut et ad. Similique neque iure aliquid odio aliquid et. Aut atque quis tempora exercitationem repudiandae et.', 15, 10, 0, '2018-12-10'),
(343, 'In sint eveniet velit aperiam iure rerum. Ullam id et quas. Maxime quaerat et minima. Blanditiis occaecati voluptatem temporibus commodi illo aut. Qui cumque dolor non eaque.', 31, 24, 0, '2018-12-10'),
(344, 'Ut deserunt sit nam quo qui. Aut impedit cumque est quae repellat qui. Et officiis ex quos at perferendis. Vel sequi est praesentium quae assumenda accusantium commodi.', 25, 24, 0, '2018-12-10'),
(345, 'Nostrum dignissimos iure perspiciatis soluta iste eveniet. Animi consequatur fuga consequatur ipsam ut enim saepe. Qui dolorum laudantium nihil ipsum qui aperiam asperiores dolorum. Ullam similique laboriosam quidem est.', 68, 21, 0, '2018-12-10'),
(346, 'Sunt id dignissimos minus incidunt. Quisquam laborum incidunt unde pariatur est laudantium et. Enim qui non mollitia.', 6, 12, 0, '2018-12-10'),
(347, 'Qui aliquam veniam voluptas dolor. Voluptatem culpa eum numquam. Sapiente nisi error nisi totam expedita quia. Delectus aspernatur quod eligendi sint.', 62, 1, 0, '2018-12-10'),
(349, 'Distinctio vitae vel laborum quia et atque. Rem praesentium optio odio quisquam. Eaque quas laudantium aut vitae aliquid.', 38, 2, 0, '2018-12-10');
INSERT INTO `comments` (`id`, `body`, `item_id`, `user_id`, `status`, `date`) VALUES
(350, 'Ipsum consequatur incidunt consequuntur. Placeat cumque quisquam dolorem et atque est.', 27, 2, 0, '2018-12-10'),
(351, 'Vel praesentium nesciunt ea deleniti corrupti tenetur voluptatem. Beatae ex fuga est quas.', 27, 13, 0, '2018-12-10'),
(352, 'Quis non illum accusamus nostrum optio. Eum eos dolorem ratione fugit. Unde omnis ullam saepe a assumenda.', 67, 1, 0, '2018-12-10'),
(353, 'Occaecati tenetur cum distinctio eos. Laboriosam et eum ipsam perspiciatis. Provident ab eos et repellendus distinctio.', 36, 17, 0, '2018-12-10'),
(354, 'Eos ad cumque libero facere sit. Aliquam vero facere architecto et. Fuga natus eum reiciendis fugiat sunt ut et. Veritatis earum labore doloremque veniam odio consequatur facilis.', 56, 20, 0, '2018-12-10'),
(355, 'Doloribus animi qui laborum aliquid natus maiores voluptatum. Autem ad rem ipsam aliquam veritatis. Omnis vel sit ex iste temporibus quia dolorem.', 12, 8, 0, '2018-12-10'),
(356, 'Qui aperiam officia sequi tempore in repudiandae. Cupiditate illum labore optio laudantium ullam est. Repudiandae nulla est dolorem suscipit eveniet possimus eius voluptas. Molestiae est est aut amet est.', 36, 27, 0, '2018-12-10'),
(357, 'Autem deleniti pariatur impedit enim. Id ipsam est nulla ut non tenetur et corrupti. Saepe quod repudiandae error ab modi est. Qui ut non molestiae voluptate impedit.', 53, 26, 0, '2018-12-10'),
(358, 'Id quas dolorem eos eius ipsum ipsum. Corrupti cupiditate laboriosam explicabo molestiae aut tenetur veniam. Occaecati eius omnis aliquid corporis voluptatem. Qui corporis tenetur sed voluptatem quo sed.', 80, 10, 0, '2018-12-10'),
(359, 'Pariatur similique maiores qui omnis dolorem. Molestiae beatae at rerum animi minima temporibus totam. Rerum et atque et animi ipsam officiis possimus.', 43, 11, 0, '2018-12-10'),
(360, 'Accusantium natus deleniti id ex impedit expedita dolore. Rerum harum est doloremque provident provident iure. Hic laudantium et quidem quasi et excepturi quis est. Temporibus numquam dolores enim ab ad. Dignissimos commodi minima est eum dolor unde eaque.', 52, 15, 0, '2018-12-10'),
(361, 'Ipsam enim earum eaque nostrum eum. Omnis corporis fugit nobis illum. Vitae minus accusamus corrupti. Id ab saepe eveniet.', 46, 26, 0, '2018-12-10'),
(362, 'Perferendis aut enim accusantium nulla consequatur itaque. Reprehenderit aspernatur ut repellat voluptatem. Perferendis repudiandae enim ut porro earum natus nisi optio. Sed et id aut nihil magnam nesciunt corporis dolores.', 77, 15, 0, '2018-12-10'),
(363, 'Nihil dolorem hic quisquam ut beatae et possimus maiores. Occaecati laborum perspiciatis id soluta totam dicta. Tempora sint et sunt non itaque quis. Asperiores veniam magnam commodi cupiditate.', 13, 6, 0, '2018-12-10'),
(364, 'Omnis minima aut asperiores ullam magni neque. Assumenda officiis id ratione explicabo doloremque vero et. Numquam officia occaecati id autem quae. Ipsa suscipit voluptatem blanditiis dolor et. Amet quo aut ipsa et consequatur repudiandae.', 78, 10, 0, '2018-12-10'),
(365, 'Ducimus voluptatum enim pariatur possimus. Et delectus eius voluptatem. Sed cupiditate minus asperiores mollitia repellendus. Voluptatem ipsum magni asperiores sed beatae odio.', 40, 15, 0, '2018-12-10'),
(366, 'Commodi dignissimos voluptatem iusto libero sed quisquam quam. Sapiente in perspiciatis possimus dignissimos asperiores quisquam aliquid. Ex praesentium suscipit et quos officia.', 57, 17, 0, '2018-12-10'),
(367, 'Qui cumque omnis quia voluptatem beatae. Exercitationem itaque ratione tenetur doloremque. Non id voluptatem officiis harum.', 60, 5, 0, '2018-12-10'),
(368, 'Iusto voluptatem et laudantium omnis quasi. Sit est dolorem corporis sunt et. Ducimus nam possimus voluptates dicta modi. Quaerat omnis accusantium laboriosam iure rerum nemo.', 76, 9, 0, '2018-12-10'),
(369, 'Neque et ipsum quo repellendus. Maxime eum quisquam ipsum dignissimos. Est culpa qui incidunt asperiores. Nihil consectetur veniam reprehenderit nisi ipsum ducimus vero.', 69, 18, 0, '2018-12-10'),
(370, 'Placeat odit et et ipsum necessitatibus voluptatibus. Ut et natus quis perspiciatis possimus deleniti. Voluptate minus exercitationem numquam eos. Voluptatum hic voluptatibus veritatis sint omnis.', 72, 27, 0, '2018-12-10'),
(371, 'Eius et aut voluptate quis vitae sapiente. Voluptas non doloribus aliquam ut. Tempore consequatur cumque voluptatum perferendis delectus. Ducimus explicabo eos id est.', 13, 18, 0, '2018-12-10'),
(372, 'Possimus sit ducimus voluptatibus nihil in. Ut qui quisquam dignissimos aperiam ut est. Dolorum repellendus non voluptate expedita. Suscipit voluptas nostrum eum eos.', 70, 9, 0, '2018-12-10'),
(373, 'Sit occaecati hic praesentium quis sit molestiae. Aut quisquam laborum non sint excepturi voluptate nulla. Harum dolorem eum et quo.', 31, 3, 0, '2018-12-10'),
(374, 'Praesentium et soluta fugiat nostrum dignissimos nesciunt. In ipsam ut debitis. Cum qui voluptatem placeat et voluptatem consequatur pariatur ex. Sunt iusto et eius ad vel saepe enim. Quas voluptates reiciendis adipisci alias.', 49, 9, 0, '2018-12-10'),
(375, 'Cum nam non perspiciatis iure aliquid inventore ut. Officia doloremque sequi quisquam. Neque quod sed voluptatem et dolores.', 71, 29, 0, '2018-12-10'),
(376, 'Aliquam eum voluptas dolores aspernatur. Harum aut perspiciatis vero quia quia facilis.', 43, 28, 0, '2018-12-10'),
(377, 'Inventore laborum consequatur facilis ea. Est ut et mollitia omnis necessitatibus voluptas. Distinctio fuga enim dolorum est tempora.', 77, 19, 0, '2018-12-10'),
(378, 'Facilis sunt et vel iusto porro odit. Delectus ea rerum amet impedit ipsa. Rerum sit dolore quae.', 35, 23, 0, '2018-12-10'),
(379, 'Enim sit omnis inventore animi. Et occaecati sunt minima neque iure. Eos voluptas ipsam ratione illum et eius. Eaque corporis nostrum fugit aut sed.', 15, 16, 0, '2018-12-10'),
(380, 'Inventore praesentium illum ullam nesciunt nesciunt accusantium. Et quibusdam mollitia hic minus minima sequi. Non ut in est architecto.', 49, 30, 0, '2018-12-10'),
(381, 'Ut quia expedita molestiae. Qui quae ad itaque inventore aspernatur maiores. Expedita quis sed molestiae illo.', 54, 9, 0, '2018-12-10'),
(382, 'Ratione voluptatibus ut consequatur atque modi. Sunt et omnis totam corporis tenetur. Voluptatibus sed non quis necessitatibus ex sed dolorem rerum.', 51, 6, 0, '2018-12-10'),
(383, 'Aut consequatur sit veritatis magni beatae aut. Odit velit mollitia officia maiores accusamus temporibus sunt aut. Qui sapiente saepe alias voluptatem. Repudiandae est ut maxime rerum in perspiciatis dolor.', 58, 22, 0, '2018-12-10'),
(384, 'Accusantium similique quo autem voluptas. Eligendi ut aut iusto ut.', 73, 7, 0, '2018-12-10'),
(385, 'Natus occaecati reprehenderit sunt repudiandae sunt qui. Nostrum veniam tempore animi illo velit.', 44, 20, 0, '2018-12-10'),
(386, 'Molestias voluptatem quia incidunt iste eos. Sint nobis dolore hic ratione odio ut. Harum eligendi cupiditate dolor quis.', 38, 22, 0, '2018-12-10'),
(387, 'Corrupti assumenda delectus veniam nobis. Vel facere necessitatibus iusto aut vel rerum fuga. Laborum beatae corrupti cupiditate in.', 10, 16, 0, '2018-12-10'),
(388, 'Culpa fugiat assumenda ut beatae laborum culpa. Sed placeat veritatis aut. Ad adipisci consectetur fugiat non nesciunt optio. Accusantium deleniti mollitia incidunt dolorem voluptatem reiciendis.', 40, 27, 0, '2018-12-10'),
(389, 'Quis aut officiis distinctio id. Incidunt excepturi placeat itaque rem. Officiis tenetur vitae quis non voluptas. Numquam atque voluptas expedita quos omnis qui vero ipsum.', 72, 16, 0, '2018-12-10'),
(390, 'Et ipsa rerum molestiae sapiente ducimus non. Totam qui et cumque officiis reiciendis enim. Molestias odio temporibus ea iste laborum facilis ut.', 27, 15, 0, '2018-12-10'),
(391, 'Quo enim possimus est nobis atque. Ut inventore sit occaecati sed expedita culpa nihil soluta. Eius vitae enim provident nihil qui ullam. Animi nostrum provident provident facilis enim quibusdam exercitationem.', 27, 26, 0, '2018-12-10'),
(392, 'Voluptatem amet sed facilis ipsum eveniet. Quod harum corporis id ut. Sed eveniet similique totam labore.', 54, 30, 0, '2018-12-10'),
(393, 'Modi ea perspiciatis id dicta dolorum. Harum dolor corrupti aut doloremque ab. Nesciunt pariatur placeat at qui consequatur et.', 35, 21, 0, '2018-12-10'),
(394, 'Non possimus maiores vitae quod quos esse ut. Natus fugit laudantium officia sunt eum et rerum. Et quod natus laborum quis assumenda hic et.', 65, 7, 0, '2018-12-10'),
(395, 'Consequatur architecto sint et et. Voluptas rem et ratione non. A quia dolores deleniti voluptatem. Fugit consequatur provident beatae consequatur minima.', 52, 18, 0, '2018-12-10'),
(396, 'Explicabo aut facere voluptatibus. Est qui neque inventore et velit maiores cupiditate. Harum voluptatibus qui est eius dignissimos est provident. A ut fugit reiciendis corporis quidem nisi.', 69, 27, 0, '2018-12-10'),
(397, 'Voluptate id deleniti vel eum sint quia. Quibusdam enim ea esse officiis aliquid dolores. Quia aut optio dolor ut libero quidem. Enim sequi et magnam et minima omnis reiciendis.', 67, 11, 0, '2018-12-10'),
(398, 'Qui ut facere architecto quia. Minus doloremque recusandae omnis non excepturi. Consequuntur ut est veniam quasi.', 43, 7, 0, '2018-12-10'),
(399, 'Qui alias eum minus id dicta repudiandae dolore ea. Unde voluptatem quas repellendus vero expedita dolore. Facere omnis sit rerum quidem et.', 10, 18, 0, '2018-12-10'),
(400, 'Atque autem dolor vero eveniet. Non necessitatibus quia modi placeat earum vero nam et. Voluptas sed vitae quia aut repellendus culpa.', 14, 9, 0, '2018-12-10'),
(401, 'Recusandae amet et sit et et pariatur accusantium ipsa. Sed aut deleniti et ut tempore. Aut est consequatur ullam inventore numquam. Ex perferendis illo ipsam harum eligendi accusantium.', 79, 18, 0, '2018-12-10'),
(402, 'Facilis qui est natus sapiente ipsum. Saepe fugit perspiciatis hic dolore. Voluptas ut eius optio neque sequi consequatur. Velit atque consequatur necessitatibus. Aut minus vitae voluptatum id voluptatem enim cupiditate.', 67, 2, 0, '2018-12-10'),
(403, 'Asperiores deleniti beatae eum quidem voluptatibus provident distinctio. Ut cum est aut sit impedit eos quibusdam consequuntur. Minima voluptate tempore magnam molestiae.', 64, 8, 0, '2018-12-10'),
(405, 'Ut nisi dicta non voluptatibus necessitatibus aliquid dolore repellat. Pariatur architecto ut autem natus.', 39, 14, 0, '2018-12-10'),
(407, 'Aperiam id unde veritatis molestiae voluptatibus. Est mollitia velit fugiat reprehenderit. Et et et iusto.', 5, 19, 0, '2018-12-10'),
(408, 'Quisquam commodi rem impedit aut. Eos ducimus necessitatibus tenetur iste ut. Quae quia facilis reprehenderit atque ratione. Unde est quas soluta doloremque.', 70, 22, 0, '2018-12-10'),
(409, 'At dicta et beatae iusto quia a et. Magni ab et quam et et et reiciendis. Perspiciatis et consequuntur libero ut incidunt non perferendis. Eum voluptatibus ipsum saepe dolor autem eum. Vel in perferendis voluptatum laboriosam.', 48, 23, 0, '2018-12-10'),
(410, 'Dolor quam repellendus minus quod maxime quia. Fugiat dolor voluptas omnis odio laboriosam odit est. Ipsum et ut similique. Quas recusandae occaecati perspiciatis ut.', 66, 22, 0, '2018-12-10'),
(411, 'Necessitatibus et quidem non aliquid labore deleniti. Quis perferendis ipsum illum iure distinctio ad vel. Quod eos veritatis exercitationem dolorum ducimus. In repellat autem odio non et autem est.', 33, 6, 0, '2018-12-10'),
(412, 'Maxime at distinctio qui est sint vel. Quia quibusdam non aut quisquam qui recusandae. Dolorum recusandae ut molestiae sit provident. Non similique expedita impedit laudantium aut quae dolorem.', 58, 30, 0, '2018-12-10'),
(413, 'Repudiandae illum voluptate consequuntur officia nihil doloribus. Perferendis non sapiente commodi unde delectus. Vel mollitia ex autem libero. Suscipit officiis tenetur error et nobis cumque omnis numquam. Quisquam natus itaque aspernatur.', 34, 29, 0, '2018-12-10'),
(414, 'Qui provident sit saepe et et. Eius quo et molestiae molestiae adipisci aspernatur. Et voluptatem rerum dolor facilis qui.', 48, 19, 0, '2018-12-10'),
(415, 'Molestiae culpa harum voluptatem ea harum deleniti tenetur. Et autem quo qui ratione est eos dolor. Et tenetur sapiente reprehenderit excepturi.', 11, 22, 0, '2018-12-10'),
(416, 'Similique consequatur sit sunt consequatur accusamus velit itaque. Recusandae optio est magni dolorum. Fugit beatae molestiae ut eos perspiciatis illo aut.', 69, 10, 0, '2018-12-10'),
(417, 'Tenetur veritatis qui nihil placeat dolor placeat. Et est molestiae velit.', 12, 9, 0, '2018-12-10'),
(418, 'Ratione mollitia dignissimos quae minima. Neque odio qui eaque quam aut quod. At sapiente aspernatur unde soluta maiores mollitia.', 59, 13, 0, '2018-12-10'),
(419, 'Consequuntur dignissimos dolore recusandae enim corporis corporis. Occaecati quae iste atque quia. Eveniet consequatur non porro eum. Quia tempore fugiat debitis quasi ipsa blanditiis reiciendis sed.', 75, 9, 0, '2018-12-10'),
(420, 'Velit id sit aut reiciendis est aut et. Enim id est repellendus distinctio neque dolore id. Rerum iusto quibusdam voluptas sint aspernatur. Quibusdam est aliquam ut qui ut praesentium deleniti.', 15, 12, 0, '2018-12-10'),
(421, 'Aut qui dicta delectus consequatur. Nihil natus illo voluptatem aliquid. Unde adipisci sed vel a reprehenderit quisquam. Deleniti aut debitis hic omnis quia sint id non.', 67, 27, 0, '2018-12-10'),
(422, 'Dolore illum qui non ipsa rerum nam. Adipisci ea laborum ea impedit non aperiam cumque. Dolor aut ut et beatae mollitia repellendus. Exercitationem eveniet praesentium eveniet molestias adipisci. Et non earum nam sunt alias tempora voluptatem.', 36, 7, 0, '2018-12-10'),
(423, 'Labore vel aut est aut perspiciatis dolorum quia. Architecto omnis odio iusto exercitationem itaque optio deleniti expedita. Voluptas culpa eaque qui perspiciatis non unde.', 56, 7, 0, '2018-12-10'),
(424, 'Voluptate hic aut nemo ut enim ex. Eum suscipit voluptas ea voluptas consequatur tenetur. Corporis nam hic quis et. Beatae debitis delectus assumenda numquam qui qui.', 24, 10, 0, '2018-12-10'),
(425, 'Magni porro iure maiores sit ut amet nam. Vero suscipit fugiat voluptate laborum distinctio. Eligendi officiis neque voluptatem aspernatur libero est perspiciatis. Impedit quibusdam omnis optio.', 44, 25, 0, '2018-12-10'),
(426, 'Voluptate aperiam quae voluptatibus. Sit quaerat et beatae nobis. Dolor voluptas corrupti voluptatem molestiae velit qui.', 12, 4, 0, '2018-12-10'),
(427, 'Tenetur quam rerum dolor maiores nemo quibusdam labore. Porro id quod perspiciatis voluptatem labore. Eum sint similique quia ea.', 61, 11, 0, '2018-12-10'),
(428, 'Eveniet officiis eum rerum velit reprehenderit et in qui. Sapiente quo ipsam et consequatur. Accusantium dolor animi necessitatibus dolores. Ea debitis est explicabo vitae est.', 44, 11, 0, '2018-12-10'),
(429, 'Eum facere earum dicta incidunt. Enim omnis dolor ducimus sit qui corporis. Voluptatem iure facilis eum. Quia ratione illo dolorum veniam molestiae totam.', 39, 4, 0, '2018-12-10'),
(430, 'Rem earum fuga placeat provident. Eos et eaque at excepturi ea dolore vero. Inventore consectetur accusantium odit natus. Ducimus neque recusandae tempora accusantium.', 12, 27, 0, '2018-12-10'),
(431, 'Perferendis accusantium quia aut impedit voluptate dolorem placeat in. Non voluptate dolorum nobis id in tempora voluptas.', 38, 16, 0, '2018-12-10'),
(432, 'Iure aliquam dignissimos fuga et et dignissimos est. Magnam fugiat adipisci delectus unde. Reprehenderit explicabo explicabo et.', 5, 16, 0, '2018-12-10'),
(433, 'Pariatur ea cum deserunt numquam non quos. Eum qui vel voluptatem voluptatibus amet et ut doloremque. Fugiat consequuntur consequatur rerum velit.', 76, 27, 0, '2018-12-10'),
(434, 'Aut atque qui similique omnis. Vel saepe eos at quas perspiciatis aut eligendi. Perferendis tenetur aut dolorem placeat quae ex eligendi. Tempora eum laboriosam impedit iste molestiae velit est.', 41, 13, 0, '2018-12-10'),
(435, 'Harum ea rerum qui ipsum excepturi quae. Totam consectetur velit ipsa sit debitis ratione. Nisi voluptate reiciendis aliquid qui quia dolor optio.', 15, 6, 0, '2018-12-10'),
(436, 'Dolorum modi aut dolorem voluptate similique qui nihil. Pariatur quia ipsa minus dolores veritatis est. Quam et ipsa quidem temporibus qui atque.', 74, 11, 0, '2018-12-10'),
(437, 'Magnam architecto asperiores aut. Ut et illo odio eligendi nihil. Aliquam error facere esse iste sed rem. Alias eum sit consequatur et doloribus iure.', 70, 22, 0, '2018-12-10'),
(438, 'Dolor modi dolorem nihil laboriosam blanditiis voluptates. Dolores exercitationem assumenda odio tempora libero exercitationem sed. Minus et dolorum consectetur incidunt earum aut aliquam. Ut assumenda nulla reprehenderit rerum harum exercitationem.', 53, 7, 0, '2018-12-10'),
(439, 'Quae eveniet ut dolorem quis eveniet. Velit consequatur non dolor nihil pariatur laudantium eum autem. Tempora sint iste non expedita. Facere quam quia rerum voluptas.', 27, 21, 0, '2018-12-10'),
(441, 'Maiores est blanditiis voluptas quo. Qui accusantium saepe incidunt magni doloremque sed eius pariatur. Maxime hic sed architecto unde.', 49, 16, 0, '2018-12-10'),
(442, 'Corporis et libero beatae aliquam soluta. Voluptatibus voluptate quis inventore officiis architecto dolorem. Corporis et iure ullam qui incidunt labore. Et consequuntur quae iure totam.', 75, 21, 0, '2018-12-10'),
(443, 'Quidem et aut enim. Error quod voluptas placeat a aperiam atque. Aut quisquam ut vitae omnis eum et quod.', 75, 22, 0, '2018-12-10'),
(444, 'Expedita nobis animi dolores aliquam. Qui distinctio omnis ut libero sit sequi non. Voluptatibus molestias qui in et dolorem.', 38, 3, 0, '2018-12-10'),
(445, 'Consequatur autem nesciunt aut quia aliquid excepturi illum vero. Suscipit beatae qui quia perspiciatis aut ducimus. Est ea et quia unde quas eius delectus. Voluptas ipsa facilis dolores sed facere voluptatibus.', 47, 11, 0, '2018-12-10'),
(446, 'Ea sit et distinctio voluptates porro. Nihil laborum quis eligendi perspiciatis sapiente quisquam odit modi. Fugiat aut consequatur non repellat. Et quidem velit enim iure incidunt.', 77, 30, 0, '2018-12-10'),
(447, 'Maiores ut a eaque animi voluptates. Placeat suscipit aliquid in fugit adipisci voluptatem. Sed eligendi autem vel et sint. Nemo iusto et sunt velit et dolorum dolor.', 12, 17, 0, '2018-12-10'),
(448, 'Nulla et est omnis corporis. Dolor ab qui eos laborum rerum pariatur expedita vel. Alias neque recusandae illum atque. Voluptas unde rerum voluptatem sunt aliquid similique.', 39, 28, 0, '2018-12-10'),
(450, 'Qui et est reprehenderit nulla accusantium omnis. Et et nam quibusdam facere nostrum maiores. Iusto distinctio animi dolore rem explicabo. Eos est voluptatem sit explicabo.', 44, 13, 0, '2018-12-10'),
(453, 'Quibusdam vel earum ab itaque dolores sit. Quia tempore autem aut quos. Fugiat labore dolorum dolorem et odit nemo. Dolores itaque ut fugit reprehenderit tempora.', 47, 10, 0, '2018-12-10'),
(454, 'Tempora cum ut sunt exercitationem quis placeat. Harum molestiae ratione optio recusandae nisi quos tempore ipsa. Esse aut voluptas ut amet est distinctio numquam.', 38, 27, 0, '2018-12-10'),
(455, 'Autem in sapiente a in optio dolorem neque. Sit aliquid earum aut ipsa. Qui in numquam molestias.', 77, 6, 0, '2018-12-10'),
(456, 'Odio consequatur numquam mollitia accusantium rem. Et exercitationem quasi itaque dignissimos voluptas iusto maxime. Excepturi excepturi eum officiis amet dolor quis. Nemo et ad quia magni.', 75, 12, 0, '2018-12-10'),
(457, 'Asperiores assumenda animi aut. Cupiditate voluptate temporibus in illum. Consequatur quia perferendis aliquid quo qui.', 80, 29, 0, '2018-12-10'),
(458, 'Qui est ut itaque adipisci. Ab doloremque dolorem nisi qui eaque est qui.', 44, 7, 0, '2018-12-10'),
(459, 'Excepturi quis distinctio saepe quaerat. Sit autem aperiam quae blanditiis placeat itaque. Provident consequuntur modi repellendus sint.', 44, 22, 0, '2018-12-10'),
(460, 'Eum aut fuga vitae non architecto consequuntur sint. Error unde non consectetur similique ut quisquam. Sit tempora repellendus rerum beatae aut dolorum.', 56, 19, 0, '2018-12-10'),
(461, 'Explicabo ea reprehenderit ad dolores ex incidunt dolor. Voluptatibus minus autem recusandae iure.', 75, 5, 0, '2018-12-10'),
(462, 'Expedita praesentium facilis magni debitis. Reprehenderit sed amet corrupti dolorem. Non ut et aut aut totam quod ut id. Illo dolores soluta et delectus.', 45, 4, 0, '2018-12-10'),
(463, 'Illo autem blanditiis ut illo ut eos. Nesciunt et et vel fuga dolore inventore reprehenderit ad. Molestiae voluptas culpa commodi repellat aut. Maiores a nostrum atque consequatur ut dicta.', 67, 15, 0, '2018-12-10'),
(464, 'Atque aut vel ea sed. Quam in ea reiciendis aperiam a eaque ratione rerum. Accusantium velit qui dignissimos qui ut cupiditate ut. Sed et cupiditate laboriosam iusto iure possimus.', 50, 14, 0, '2018-12-10'),
(465, 'Saepe ab vitae ut ab occaecati. Ut nulla ad est sed odit eum. Magni quasi incidunt sapiente quod.', 64, 4, 0, '2018-12-10'),
(466, 'Sunt facere est asperiores modi ut. Voluptas nobis laudantium similique nihil numquam dolores voluptatibus illum. Aspernatur vero laboriosam quod expedita esse qui.', 80, 30, 0, '2018-12-10'),
(467, 'Ipsa quia natus qui voluptatem. Rerum distinctio qui nihil qui id. Maiores voluptatem dolores molestiae enim voluptatem possimus maxime accusamus. Molestiae non nostrum tempora dicta.', 75, 20, 0, '2018-12-10'),
(468, 'Qui aut voluptas ea qui. Dolores voluptates et quasi ratione aut totam id.', 67, 15, 0, '2018-12-10'),
(469, 'Et et autem ab quia. Placeat quas earum voluptas excepturi assumenda. Tempora laudantium quos magnam quasi quia nobis optio. Modi quo soluta earum minus non corrupti.', 35, 9, 0, '2018-12-10'),
(470, 'Tempore quisquam nisi sit repellat inventore quos. Natus dolor quia earum ut cum dolorem. Quidem dolorem et voluptas autem. Sit tempora ab id et.', 25, 30, 0, '2018-12-10'),
(471, 'Praesentium mollitia qui et repellendus aliquid. Itaque tenetur laborum voluptas consequatur.', 47, 11, 0, '2018-12-10'),
(472, 'Vitae incidunt debitis unde aliquam. Veritatis harum sequi aut voluptas id nemo et dolores. Quae sint eligendi vero ut. Impedit ut alias eius similique unde soluta commodi.', 11, 20, 0, '2018-12-10'),
(473, 'Maxime quo ut nulla commodi atque accusamus. Et repudiandae et iste a vel.', 81, 1, 0, '2018-12-10'),
(474, 'Natus sit tempora doloremque. Sed voluptatem repellat maxime. Facilis voluptatem ex maxime reiciendis. Aut quasi nostrum sint ut blanditiis nostrum amet.', 65, 6, 0, '2018-12-10'),
(475, 'Dolor ut nostrum ut veritatis. Unde totam suscipit explicabo qui. Sed minima officiis quia ad omnis.', 65, 17, 0, '2018-12-10'),
(477, 'Sed unde itaque ea omnis. Consectetur provident cupiditate cumque. Hic et tempora debitis est.', 43, 16, 0, '2018-12-10'),
(478, 'Consequatur sapiente unde dolores id et. Dolorum tempore enim dolor quia. Rem quos beatae quod ut quibusdam. Fugiat facilis autem id corrupti commodi. Aut vel dolorum optio inventore qui accusantium.', 54, 6, 0, '2018-12-10'),
(479, 'Nostrum reiciendis beatae dolorem atque ab. Omnis non dolores vel debitis hic quos temporibus. Fugit at aut quia esse. Voluptatem vero quis est molestiae ad porro. Sit rerum mollitia rerum porro pariatur rem molestiae.', 27, 23, 0, '2018-12-10'),
(480, 'Officiis et aut est ut ex. Id sunt consequatur voluptatem minima. Dignissimos qui in beatae perspiciatis ducimus laudantium vel.', 72, 4, 0, '2018-12-10'),
(481, 'Reiciendis rerum et debitis fuga. Explicabo ducimus omnis ut sunt quia qui consequuntur. Adipisci aliquid aliquid quia enim nulla. Voluptatem eligendi minus natus pariatur rem corrupti voluptatum.', 66, 15, 0, '2018-12-10'),
(482, 'Quo et sunt alias debitis itaque explicabo. Voluptatem quis fuga deleniti blanditiis voluptates fugiat. Autem occaecati vel culpa necessitatibus autem odit.', 56, 2, 0, '2018-12-10'),
(483, 'Alias vel eos libero aliquid voluptates mollitia. Ut vero quaerat quisquam.', 51, 11, 0, '2018-12-10'),
(484, 'Nostrum est et excepturi voluptas provident deserunt. Fugit ex non aut illo esse aut. Repellendus omnis eum distinctio voluptatem quo eum ad reiciendis. Quod eum laborum dicta facere consequatur.', 15, 21, 0, '2018-12-10'),
(485, 'Est delectus est pariatur hic sit fugiat quibusdam eum. Ut consectetur qui aut vel cumque. Ratione earum nihil quis numquam deserunt optio veniam. Doloribus quia dolorem voluptatum delectus facere.', 60, 4, 0, '2018-12-10'),
(488, 'Laborum quisquam architecto consequuntur dolorem doloremque. Culpa numquam nam qui excepturi consectetur eaque sint. Autem hic debitis repellat totam nostrum.', 49, 24, 0, '2018-12-10'),
(489, 'Sed quibusdam tenetur placeat aspernatur consequuntur numquam ad rerum. Est sequi nihil aliquam natus.', 44, 27, 0, '2018-12-10'),
(490, 'Reiciendis ab ex autem aut quia libero. Quia consequatur autem inventore dignissimos est sed molestias. Et odio error sequi est modi sint cupiditate. Nemo deserunt iure dolores. In sed et veritatis mollitia optio officia.', 64, 26, 0, '2018-12-10'),
(491, 'Omnis voluptatem expedita nam fuga. Alias dolores sit nihil. Fuga assumenda rerum ea dolor. Aspernatur eligendi ut esse.', 14, 4, 0, '2018-12-10'),
(492, 'Sapiente in explicabo et ut animi cum. Repellendus quos nisi possimus dolor sint fugiat quia. Iste vel quae velit id eaque.', 34, 13, 0, '2018-12-10'),
(493, 'Dicta quo et nemo ratione vitae officiis expedita. Et labore in cumque. Dicta nesciunt voluptatem nobis est mollitia nam iusto. Velit aut veniam optio voluptas fugit.', 37, 10, 0, '2018-12-10'),
(494, 'Voluptas assumenda aliquid fugiat. Voluptatem laboriosam voluptatem accusamus error rerum. Autem enim velit maxime a neque. Minima consequatur molestiae minima tempora aut.', 49, 29, 0, '2018-12-10'),
(495, 'Dolores sed error qui deserunt ut doloremque ex. Consectetur vel omnis aspernatur ducimus blanditiis excepturi est repellendus. Sequi sunt non est fugiat ipsa.', 58, 1, 0, '2018-12-10'),
(496, 'Enim facere fugit enim magnam. Sit earum voluptatum nostrum atque aut. Dolorem id enim tempore velit expedita hic. Sapiente qui enim ut voluptate quis. Blanditiis sed vel qui non eaque sit.', 27, 1, 0, '2018-12-10'),
(497, 'Voluptas vitae asperiores aut nihil facilis occaecati dolorum. Quam id quia iste voluptatem impedit dolorem quos quod. Dolorem neque et voluptas sit. Rerum voluptates fuga ut ut et qui.', 77, 10, 0, '2018-12-10'),
(498, 'Quo occaecati officia nemo libero voluptates maxime. Tempore aut ut magnam veniam aliquam excepturi aliquam. Totam ex dignissimos eveniet dicta facere.', 46, 10, 0, '2018-12-10'),
(499, 'Explicabo illum eius quod possimus veniam architecto rerum. Vitae veritatis tempora magnam exercitationem. Sed quam sed id quis asperiores officia.', 13, 28, 0, '2018-12-10'),
(500, 'Et error quo sapiente consequuntur nihil sint et. Consectetur deserunt similique alias vel. Et maxime qui qui doloremque error qui qui.', 60, 25, 0, '2018-12-10'),
(501, 'Et fugiat rem aut amet labore id nobis. Dolores in nihil expedita voluptatem hic. Consequatur quisquam repellendus eum nihil.', 25, 11, 0, '2018-12-10'),
(502, 'Enim necessitatibus omnis magni cum expedita est placeat. Placeat pariatur consequatur et velit non cupiditate.', 57, 1, 0, '2018-12-10'),
(503, 'Cupiditate occaecati eius hic quod quasi. Assumenda et expedita corporis dolorem. Tenetur neque nihil nulla dolorum laudantium dolores omnis.', 58, 21, 0, '2018-12-10'),
(504, 'Asperiores in voluptatem ea ipsum qui. Sapiente repellat cupiditate voluptatem natus non culpa.', 14, 28, 0, '2018-12-10'),
(505, 'Excepturi et aut sed minus et error ad. Ut aperiam alias non nulla aut quia. Voluptatum consectetur tempore saepe sapiente. Aut nostrum velit non repellat numquam debitis nihil.', 10, 26, 0, '2018-12-10'),
(506, 'Alias voluptas nulla voluptatibus quis recusandae quisquam architecto. Ut sit dolores consectetur error autem blanditiis.', 67, 18, 0, '2018-12-10'),
(507, 'Consequatur soluta dolores qui ut quibusdam. Nihil est pariatur cumque ad quia. Aut perferendis est nostrum sed voluptatem similique. Rerum molestiae molestiae occaecati rerum omnis nesciunt.', 39, 26, 0, '2018-12-10'),
(508, 'Quia qui eum unde quia aperiam et at. Sed perferendis eligendi iure architecto quia vero. Ad excepturi quis natus eos quod cumque.', 12, 9, 0, '2018-12-10'),
(509, 'Quo quis minima rerum fuga et culpa quaerat. Veritatis voluptas et occaecati necessitatibus aut sed sit sed. Vel aut omnis animi ut. At et laudantium culpa.', 44, 2, 0, '2018-12-10'),
(510, 'Perferendis est delectus et accusamus vitae nihil veritatis dolores. Earum dignissimos voluptatem aut dolorum ut molestias. Eos officiis eos sint qui. Aperiam deserunt maxime iusto debitis et. Voluptas officiis omnis dolor aut esse maxime ex.', 67, 7, 0, '2018-12-10'),
(511, 'Omnis quo ut facilis ut. Aliquam consectetur commodi molestias eos reprehenderit dicta eos. Distinctio quia velit quam laudantium.', 14, 5, 0, '2018-12-10'),
(513, 'Sequi consequuntur similique facilis quos maxime. Quidem aut voluptatum sint. Vel ut et voluptatem ratione.', 39, 2, 0, '2018-12-10'),
(514, 'Harum tempora aspernatur dolores dolorem nam blanditiis velit. Suscipit ullam porro dolorem rem aut quia. Saepe reprehenderit suscipit odio.', 50, 17, 0, '2018-12-10'),
(515, 'Et aut consequatur quas dolores. Voluptas consequuntur et nobis aliquam placeat. Aut repellendus unde ducimus est. Perferendis id ducimus soluta dolorum debitis.', 12, 29, 0, '2018-12-10'),
(516, 'Dolores aut aut consequatur facere rerum. Iusto natus aut nihil corrupti doloribus delectus. Repudiandae aliquam quidem quos dolores aliquid magni itaque. Modi et quod ex perspiciatis eveniet.', 48, 24, 0, '2018-12-10'),
(517, 'Enim aut eveniet voluptatibus maxime similique pariatur incidunt. Non sed sint est nisi neque.', 12, 15, 0, '2018-12-10'),
(518, 'Cupiditate blanditiis voluptate aperiam accusamus. Dolorum eum non est soluta est reprehenderit sed illo. Et iure qui nesciunt quas ipsum perspiciatis.', 50, 1, 0, '2018-12-10'),
(520, 'Optio ut optio beatae doloremque hic magnam. Ullam quia labore excepturi consequatur neque beatae. Distinctio molestiae rem perspiciatis voluptatem accusantium.', 52, 29, 0, '2018-12-10'),
(521, 'Repellat quis laboriosam illo optio omnis optio. Repudiandae est cumque ut voluptatem. Vitae quo dolores dolorem. Adipisci corporis quam sunt dolores in.', 64, 2, 0, '2018-12-10'),
(522, 'Est iusto quaerat voluptatem ullam omnis et saepe. Inventore qui harum nam ut tempore et. Autem tempore dolor consequuntur excepturi.', 76, 16, 0, '2018-12-10'),
(523, 'Consequuntur est quo aliquam. Voluptatem rerum corrupti qui eum. Reiciendis quam dolor suscipit omnis.', 33, 27, 0, '2018-12-10'),
(524, 'Eveniet saepe est quibusdam sed repudiandae rerum et et. Autem labore aut laboriosam voluptatem qui velit commodi quibusdam. Quas qui quia asperiores veniam. Et et nulla commodi iusto neque.', 14, 23, 0, '2018-12-10'),
(525, 'Ipsa velit aut deleniti aut quae. Aut repellat quas ut consequatur unde repudiandae. Dolor dolorem fugiat facere quisquam dolore. Ut in dolor qui saepe molestias.', 38, 12, 0, '2018-12-10'),
(526, 'Quia hic sapiente architecto quaerat. Dolorem nisi optio aliquid reprehenderit odio. Veritatis similique culpa sunt qui reprehenderit. Asperiores autem ut accusamus.', 71, 14, 0, '2018-12-10'),
(527, 'Accusamus blanditiis occaecati neque amet consequatur. Hic animi tempora nihil dolore. At quia nesciunt optio pariatur rerum repudiandae sed. Sit sed et asperiores et aut.', 44, 8, 0, '2018-12-10'),
(528, 'Eum exercitationem tempore consequatur quia iure architecto dolor. At aut tenetur consequatur. Nemo sunt occaecati doloribus voluptatibus et ut ipsa. Reprehenderit et asperiores eum alias ipsa.', 13, 27, 0, '2018-12-10'),
(530, 'Id recusandae quia omnis optio eum. Modi aut incidunt aut quibusdam. Iusto natus blanditiis eius quia.', 46, 4, 0, '2018-12-10'),
(531, 'Eos eum est quae nisi molestiae praesentium et. Et molestiae quasi dolor. Eveniet aut quas est atque reprehenderit veritatis.', 65, 19, 0, '2018-12-10'),
(532, 'Et excepturi provident assumenda. Natus quis voluptatum eligendi consectetur. Quis ea laboriosam ipsum pariatur in qui voluptas. Odit dolores consequatur in porro sunt et dolore dolorem.', 78, 8, 0, '2018-12-10'),
(533, 'Quibusdam fuga blanditiis in eos excepturi vel aut. Est quis ab sequi et. Omnis et quaerat atque consectetur dolores ex quo. Nostrum hic natus asperiores illo facere quos modi.', 78, 5, 0, '2018-12-10'),
(534, 'Unde odit placeat rerum in voluptate amet. Suscipit eos repellendus in. Quia doloribus fugiat eum.', 75, 26, 0, '2018-12-10'),
(535, 'Odit repudiandae occaecati dolorum doloremque quisquam enim. Est ab illum magnam non sint. Laudantium reprehenderit architecto repudiandae accusamus unde. Est dolores dolorem totam dolorum debitis est.', 61, 14, 0, '2018-12-10'),
(536, 'Rerum molestiae voluptates ipsum quod natus harum. Odit voluptates quia hic ex. Qui aut ullam saepe itaque ea eum repellendus et. Inventore consequatur qui praesentium quo eligendi suscipit adipisci. Aperiam repudiandae perspiciatis et iusto similique vitae voluptate dolor.', 34, 11, 0, '2018-12-10'),
(537, 'Et qui est fuga corporis. Voluptas ipsa corporis suscipit facilis.', 76, 23, 0, '2018-12-10'),
(538, 'Et quo quia possimus quia ut explicabo magni perspiciatis. Quam enim in sequi dolorem qui amet unde. Rerum deserunt autem molestias occaecati voluptas modi accusamus.', 46, 1, 0, '2018-12-10'),
(539, 'Sint deleniti vel saepe non. Neque voluptatum libero suscipit. Necessitatibus eius reprehenderit perferendis autem ut. Possimus explicabo quam cupiditate sint enim cum. Aliquid recusandae libero quasi officia quod doloremque commodi aut.', 37, 27, 0, '2018-12-10'),
(540, 'Quis est mollitia molestias quidem minima enim. Facilis tempore vero rem et. Expedita rerum omnis consequuntur ut a mollitia. Velit enim modi nesciunt eligendi blanditiis odio cum dolorem.', 11, 27, 0, '2018-12-10'),
(541, 'Voluptatem porro aut sequi impedit corrupti. Vel omnis sit aut qui vitae eum.', 67, 11, 0, '2018-12-10'),
(542, 'Corporis dolores dolorem corrupti sunt et. Quis itaque temporibus quis aliquid nihil eum. Consequatur expedita officia quo debitis unde voluptate. Beatae ut corporis vitae nesciunt.', 42, 13, 0, '2018-12-10'),
(544, 'Dolorum quo ducimus laborum qui dolores architecto voluptates nam. Ad dolores eos at dolorem ea.', 36, 16, 0, '2018-12-10'),
(545, 'Et numquam aut ullam ex. Voluptatem quia consequatur magnam. Facilis quasi nisi porro voluptatibus.', 74, 5, 0, '2018-12-10'),
(546, 'Hic sunt eum natus necessitatibus. Est sunt ut nam quis est rem. Enim tenetur ut rem dolores tenetur in. Et nihil aut delectus quis quibusdam quas odit.', 43, 5, 0, '2018-12-10'),
(547, 'Voluptas quia placeat a itaque dolorem commodi. Accusamus sed temporibus dolores iusto deserunt ullam. Molestiae ad expedita inventore quisquam accusantium. Id quia pariatur aliquid incidunt.', 48, 13, 0, '2018-12-10'),
(548, 'Quo voluptatem error aut asperiores. Eos deserunt rem hic perspiciatis odio magnam modi quo. Exercitationem unde animi corporis qui officiis.', 52, 15, 0, '2018-12-10'),
(550, 'Consectetur aperiam ut repudiandae sed dolor quo. Molestiae officia autem qui aliquid enim inventore. Ea voluptas magnam ut similique. Odit excepturi sunt ut pariatur.', 31, 26, 0, '2018-12-10'),
(551, 'Amet magnam earum et error reprehenderit consectetur nihil. Adipisci eos molestiae adipisci qui consequatur debitis ut voluptatibus. Voluptates ipsam officia dignissimos mollitia excepturi. Fugiat saepe tempora est delectus consequuntur modi natus.', 71, 1, 0, '2018-12-10'),
(552, 'Eum praesentium excepturi dolores accusantium ad ut non maxime. Harum voluptas autem voluptatem. Animi cum rem est reprehenderit ducimus eveniet perspiciatis libero.', 69, 7, 0, '2018-12-10'),
(553, 'Pariatur qui vero voluptas repudiandae quis. Molestias non maiores et veniam fugit et. Quas voluptates id aut.', 43, 12, 0, '2018-12-10'),
(554, 'Laboriosam velit nesciunt error accusantium eaque rerum et. Incidunt vel sunt eos sapiente rerum officia. Dolore repudiandae cumque occaecati error voluptatem. Voluptatem impedit velit accusamus sit vero et.', 75, 9, 0, '2018-12-10'),
(555, 'Expedita autem animi sit sed ad ullam. Quia doloribus ut voluptas dolores molestiae eveniet. Natus ullam odio quia hic eveniet.', 36, 6, 0, '2018-12-10'),
(556, 'Tempora exercitationem optio soluta aut ut. Voluptatem doloribus ducimus saepe quas. Est repellat quidem perferendis voluptate et aperiam numquam. Rerum asperiores mollitia dolorem.', 66, 19, 0, '2018-12-10'),
(557, 'Modi esse et quas saepe repellat consequatur. Enim in voluptatibus iste. Laborum quaerat laboriosam et perferendis quo et vel.', 12, 27, 0, '2018-12-10'),
(558, 'Ullam consequatur cupiditate impedit quod aperiam. Aperiam dicta corporis ut cumque. Asperiores et distinctio quo pariatur repudiandae rerum consequatur. Quos enim nisi occaecati velit quos.', 77, 10, 0, '2018-12-10'),
(561, 'Beatae soluta quisquam modi odio. Nam incidunt quo at doloribus. Nesciunt quas expedita vel architecto blanditiis qui libero.', 42, 17, 0, '2018-12-10'),
(562, 'Natus hic iste nisi corrupti beatae a velit quo. Placeat ut sit vel qui. Aperiam assumenda ad vero expedita et.', 39, 18, 0, '2018-12-10'),
(563, 'Eos et cumque consequatur voluptates nemo. Non beatae et voluptas eaque quibusdam quia minus. Voluptatem velit sed officiis est enim. Veritatis ad qui exercitationem.', 42, 4, 0, '2018-12-10'),
(564, 'Perspiciatis ut velit aut nihil quo et. Id itaque dolorem ut laudantium. Qui non eius cupiditate veritatis recusandae ea. Accusantium exercitationem sed deleniti voluptas minima dolor iure.', 73, 25, 0, '2018-12-10'),
(565, 'Nihil dicta ut sint eveniet est distinctio. Est rerum laboriosam doloribus sapiente distinctio. Quas ut quisquam quia repellat provident dolor. Quae iure commodi non dolore.', 50, 11, 0, '2018-12-10'),
(567, 'Cupiditate eos soluta sed dolore recusandae odio. Itaque soluta et dolorum ex. Omnis ut molestiae officia exercitationem qui eum. Ut minima est est odio odio et neque eaque.', 74, 22, 0, '2018-12-10'),
(568, 'Praesentium numquam praesentium accusantium distinctio nostrum velit cum. In corporis id eaque provident tempore adipisci doloribus. Quas amet placeat pariatur minus et quis. Totam culpa voluptatum id suscipit non delectus necessitatibus aliquam.', 25, 10, 0, '2018-12-10'),
(570, 'Eveniet architecto voluptas aut mollitia voluptatibus enim aspernatur voluptas. Recusandae maxime nulla ea. Est laudantium suscipit alias minima magnam beatae. Quia eum voluptatum neque a aliquam repellat aut.', 62, 26, 0, '2018-12-10'),
(571, 'In dicta unde molestiae explicabo nisi quo dicta excepturi. Dolor optio eum saepe qui. Et sint rerum dolor est.', 10, 30, 0, '2018-12-10'),
(572, 'Est voluptate et similique fuga sunt cum harum. Enim non quasi sint voluptates tenetur. Beatae voluptatem enim exercitationem suscipit dolor voluptatem suscipit velit. Ullam voluptatem rerum deserunt ab. Aliquam excepturi harum id dolorem officia.', 80, 8, 0, '2018-12-10'),
(574, 'Exercitationem beatae labore qui ut nemo. Qui voluptas unde ullam quo voluptatem.', 65, 10, 0, '2018-12-10'),
(575, 'Minima sint est quisquam sunt dolor ratione. Provident suscipit et quis quia vitae officia. Quaerat ea exercitationem dolorem accusamus totam id.', 70, 18, 0, '2018-12-10'),
(576, 'Rem ratione autem ipsa enim accusantium autem quaerat. Ea eum vitae molestias aliquam accusamus similique sapiente. Enim at ut quos enim.', 46, 23, 0, '2018-12-10'),
(577, 'Eum architecto dolor voluptates iusto. Qui eos atque sed voluptatem error sed et et. Natus quia et voluptatem error consequuntur. Sint nemo dolor dicta et.', 68, 9, 0, '2018-12-10'),
(578, 'Ea non quisquam saepe. Quia doloribus magnam aliquid ut nulla. Ipsa vero consectetur sint quis. Excepturi alias fuga aut architecto quam et accusantium.', 79, 13, 0, '2018-12-10'),
(579, 'Repellat consequatur molestiae est ipsum aut. Rerum dolore beatae eligendi asperiores.', 60, 11, 0, '2018-12-10'),
(580, 'Quo aspernatur est maiores doloremque hic minus. Corrupti occaecati est mollitia quia atque. Voluptatem voluptatum et enim numquam inventore velit nemo. Magni ut porro provident non fuga quam.', 5, 17, 0, '2018-12-10'),
(581, 'Quis explicabo sint qui expedita. Quia non quibusdam similique ullam eos optio molestiae quos.', 62, 17, 0, '2018-12-10'),
(582, 'Voluptates veniam qui ut quibusdam provident quisquam nobis. Aspernatur soluta similique labore ipsam consequuntur. Eos rerum molestiae velit illum officiis ipsum.', 74, 10, 0, '2018-12-10'),
(583, 'Blanditiis recusandae occaecati quia esse voluptas tempora. Quis quia a corrupti et. Omnis est eveniet aut. Exercitationem suscipit reprehenderit dolorum dolorem. Placeat accusantium nesciunt minima.', 53, 29, 0, '2018-12-10'),
(584, 'Explicabo delectus rerum dolorem ratione dignissimos iure officia deserunt. Non esse labore omnis quaerat vel. Tenetur voluptatem consequatur aperiam tempore.', 33, 5, 0, '2018-12-10'),
(585, 'Aut qui minima omnis aut maiores totam. Eius illum et ea ducimus. Vel alias voluptatem consequatur. Blanditiis temporibus dolorem repudiandae consectetur delectus nihil ut. Omnis quaerat delectus sunt commodi et ut.', 59, 6, 0, '2018-12-10'),
(586, 'Minima enim in aspernatur architecto vitae vero. Sit quas nemo sit sed. Ipsum aut voluptas qui voluptatem harum illum fuga. Blanditiis ut dolor enim.', 61, 28, 0, '2018-12-10'),
(587, 'Quae consequatur consequatur nisi doloribus. Eos quasi dolores officia veniam itaque. Et suscipit saepe veritatis sequi voluptatem inventore. Suscipit error accusamus distinctio velit omnis quas qui repudiandae.', 67, 29, 0, '2018-12-10'),
(588, 'Voluptas voluptas odio et omnis consequuntur cupiditate. Repellendus pariatur similique eaque mollitia rerum nam repellendus. Quo voluptas ratione et maiores.', 45, 24, 0, '2018-12-10'),
(589, 'Enim voluptate vitae corporis perferendis. Expedita non id repellendus quia. Unde beatae libero accusantium debitis.', 53, 15, 0, '2018-12-10'),
(590, 'Dolorem sint rerum odio modi et ut. Dolore officia consequuntur architecto at deserunt. Quae placeat molestias quo consequatur architecto est.', 80, 1, 0, '2018-12-10'),
(591, 'Et debitis ut rerum et est officiis quae. Quod sapiente illo dolores ducimus dolor aliquid. Sed cupiditate quia possimus aut maxime maxime consectetur. Sequi ducimus qui omnis fuga.', 69, 12, 0, '2018-12-10'),
(592, 'Vero qui in aut veniam. Et sed ratione molestias velit. Quia fuga aut natus quasi. Laboriosam atque sapiente ut molestias voluptas.', 54, 27, 0, '2018-12-10'),
(593, 'Eligendi quod impedit adipisci temporibus necessitatibus molestias facilis. Ducimus distinctio dolorem autem exercitationem suscipit doloribus sapiente omnis. Non necessitatibus mollitia harum quia beatae laborum dolorum. Quo dolorem reprehenderit voluptas eligendi.', 76, 15, 0, '2018-12-10'),
(594, 'Ullam harum necessitatibus voluptatem dolore quo pariatur qui. Ex vel facilis quia. Laboriosam quae est facere deserunt. Sint qui maiores doloremque.', 72, 23, 0, '2018-12-10'),
(595, 'Quia asperiores in impedit. Dolorum adipisci et quos corrupti esse neque sunt. Hic in provident animi aut. Consequatur voluptas amet facere est eveniet quidem eum.', 37, 23, 0, '2018-12-10'),
(596, 'Corrupti est nihil aut sit. Deleniti consequatur laborum veritatis commodi dolores. Sit quis at eligendi.', 47, 3, 0, '2018-12-10'),
(597, 'Incidunt distinctio ut amet nam ex omnis atque. Veniam adipisci hic qui aut quia. Sequi fuga voluptas sint ullam.', 38, 24, 0, '2018-12-10'),
(598, 'Animi eius dignissimos et deserunt. Quas debitis quos alias sunt. Deserunt ullam eum ex. Ipsam qui omnis excepturi.', 43, 23, 0, '2018-12-10'),
(599, 'Eligendi recusandae modi dolores tempore. Vel dolorem nemo ducimus. Vitae officia nostrum sed. Nesciunt quae maxime repellat et.', 31, 4, 0, '2018-12-10'),
(600, 'Reiciendis magnam consequatur enim qui. Doloremque alias sit ut maxime aliquid repudiandae quo. Natus nam qui quos est. Quisquam illum quia similique amet.', 73, 6, 0, '2018-12-10'),
(601, 'Et nemo rem tempore. Aut et nihil atque nihil in dicta architecto. Repellat est omnis minus qui ducimus aut.', 31, 2, 0, '2018-12-10'),
(602, 'Pariatur quam quia atque est ut eum nesciunt. Qui ab ut beatae porro aut. Consectetur quisquam ut voluptatem. Ea deleniti ut recusandae tenetur illum maiores.', 74, 14, 0, '2018-12-10'),
(603, 'Autem modi fugit id accusamus laudantium repellendus labore. Qui excepturi tempora est. Quia ea voluptas aut nam officiis aut sit. Ut est soluta dolore.', 43, 29, 0, '2018-12-10'),
(604, 'Adipisci culpa doloribus in voluptatem impedit expedita. Deleniti quia nostrum eveniet nihil modi. Numquam similique quod ut beatae et exercitationem aut.', 81, 8, 0, '2018-12-10'),
(605, 'Est ipsa optio possimus. Voluptatem eum et voluptatem cumque nemo. Consequatur ea tempore rerum vel. Rem enim ut aspernatur accusantium hic optio numquam.', 64, 6, 0, '2018-12-10'),
(606, 'Et laboriosam ullam corrupti accusamus sit non atque. Qui cupiditate quia rerum fugit commodi. Quas error doloremque accusamus voluptatum totam quo. Necessitatibus dolorum asperiores delectus dolorem quo nihil perferendis reiciendis.', 6, 7, 0, '2018-12-10'),
(608, 'Doloremque voluptatem est voluptatem est. Et qui corporis molestiae. Officia ut consequatur voluptate distinctio nihil rem corrupti.', 68, 28, 0, '2018-12-10'),
(609, 'Explicabo sed consectetur nobis officiis alias impedit aliquid. Pariatur rerum aut saepe aspernatur reprehenderit culpa animi. Delectus sit consequuntur dolor omnis at velit minus in.', 46, 25, 0, '2018-12-10'),
(610, 'Voluptas iure et voluptatum quia aliquam dolorem autem quibusdam. Quas vel recusandae voluptates et aut quam. Molestiae minima rerum officia quis voluptatem numquam. Laboriosam quis et dolor nesciunt exercitationem.', 6, 19, 0, '2018-12-10'),
(611, 'Pariatur sunt et aperiam quos magnam. Animi qui illum soluta earum. Ipsum aut eum modi qui quibusdam deserunt quaerat. Odio doloremque quasi praesentium quis dolor. Et nihil molestias tempora recusandae.', 59, 19, 0, '2018-12-10'),
(612, 'Rerum ipsa aspernatur ea laborum expedita aut necessitatibus. Optio quae non voluptatum veritatis. Occaecati ipsa deleniti ut porro. Delectus nulla commodi voluptatem veniam maiores.', 67, 25, 0, '2018-12-10'),
(613, 'Voluptatum dolorum in voluptas rerum harum asperiores et. Omnis ab eos libero delectus et. Est error molestiae et ab. Provident qui voluptas ducimus dignissimos praesentium.', 15, 15, 0, '2018-12-10'),
(614, 'Iste voluptatem saepe commodi enim aut quia. Veniam eaque vitae magni aspernatur. Molestiae nobis labore labore aperiam vel corporis. Explicabo est quis ut laborum.', 52, 26, 0, '2018-12-10'),
(615, 'Iure eaque ut quod excepturi qui. Soluta autem quo hic tempora architecto ratione fugiat et. Repudiandae odio quo architecto minima.', 58, 17, 0, '2018-12-10'),
(616, 'Totam debitis rerum reprehenderit quisquam quos ratione autem. Mollitia necessitatibus esse occaecati qui ut. Ut eveniet autem repellendus. Odit velit autem dicta rem suscipit et commodi.', 70, 6, 0, '2018-12-10'),
(618, 'Explicabo voluptatem dicta cum aperiam tenetur. Iusto id perspiciatis voluptas et. Eos laudantium laboriosam ullam ea sed molestiae unde. Ipsa eius et qui ea.', 60, 24, 0, '2018-12-10'),
(619, 'Sit vero aut aliquam aperiam sit. Veritatis nisi mollitia vitae fugit eos et molestiae. Odit molestiae labore blanditiis eum qui autem explicabo est. Ullam distinctio neque harum qui deserunt.', 57, 4, 0, '2018-12-10'),
(620, 'Reprehenderit quod dignissimos eaque reiciendis maxime. Facilis ut rerum enim voluptatem doloremque vitae. Est pariatur consequatur architecto.', 37, 21, 0, '2018-12-10'),
(621, 'Et quis odio quibusdam molestiae aut. Esse et aperiam non ea. Eaque non impedit necessitatibus impedit voluptas. Quae aut accusantium cumque et exercitationem distinctio aliquid nesciunt.', 51, 15, 0, '2018-12-10'),
(622, 'Error est ducimus ut quibusdam. Ab necessitatibus rem rerum est. Quia placeat fugiat reprehenderit eligendi. Corporis velit officia enim molestiae deserunt modi rerum.', 64, 27, 0, '2018-12-10'),
(623, 'Dolor ut dicta aperiam pariatur dolores voluptate vero sunt. Harum perferendis labore aliquid maxime unde nobis. Unde aut totam expedita occaecati odio quo.', 46, 25, 0, '2018-12-10'),
(624, 'Reiciendis dolores occaecati illo voluptatem ullam error. Sint voluptate exercitationem magni porro a. Soluta rem sit laborum architecto ad et sit voluptatem.', 70, 4, 0, '2018-12-10'),
(625, 'Veniam sit quisquam recusandae eos omnis. Quia doloremque accusantium nesciunt id deleniti consequatur natus praesentium.', 81, 4, 0, '2018-12-10'),
(626, 'Aspernatur et soluta in officiis nobis voluptatibus. Nam rem numquam est cumque. Ratione dolores non nam iste autem. Ea ut fugiat laboriosam praesentium.', 65, 16, 0, '2018-12-10'),
(627, 'Laudantium vel facilis omnis aut in autem qui. Vel deserunt placeat aut fuga. Et est et non quo. Labore ut tempore et qui facilis voluptatum reiciendis.', 64, 20, 0, '2018-12-10'),
(628, 'Rerum perferendis molestias itaque odio tempore. Aut iusto aut ut enim numquam modi maiores voluptatibus. Odit mollitia voluptatem nam aut.', 64, 11, 0, '2018-12-10'),
(629, 'Odio ullam enim quam repellendus aut eos ea. Ipsa beatae est aperiam reiciendis. Eligendi labore minima soluta placeat aliquam molestias.', 40, 26, 0, '2018-12-10'),
(630, 'Quod et earum ea ad. Dolorem qui voluptas sunt exercitationem repudiandae dolores et. Blanditiis sit unde vero aut rem perferendis sit.', 54, 14, 0, '2018-12-10'),
(631, 'Sunt similique non sapiente maiores aut qui nesciunt. Est velit est est sit sed quas. Vero soluta veritatis non aut maiores numquam perferendis. Quam itaque nihil hic natus vel quod tempora. Accusamus voluptate doloremque voluptatem in dolores.', 43, 17, 0, '2018-12-10'),
(632, 'Quasi minus iure quis aut ducimus distinctio. Ex et nihil aut dignissimos iste assumenda facere. Minus quos impedit cumque architecto qui. Fuga dolorem non recusandae exercitationem qui delectus.', 46, 30, 0, '2018-12-10');
INSERT INTO `comments` (`id`, `body`, `item_id`, `user_id`, `status`, `date`) VALUES
(633, 'Nesciunt quo autem temporibus molestiae. Tenetur recusandae dolorem accusamus. Tempore at perferendis aut. Dolores doloribus aut at et rerum architecto id.', 42, 26, 0, '2018-12-10'),
(634, 'Non et adipisci et cupiditate quo in aut. Est voluptatibus neque cumque dolorem aliquam eligendi at. Laudantium quisquam rem aliquid voluptatibus pariatur. Earum facilis a doloremque consequatur laborum dignissimos repellendus.', 31, 29, 0, '2018-12-10'),
(635, 'Eveniet architecto fugit nobis dolor dolores est. Similique magni odio id aliquam maxime velit nulla. Sunt blanditiis modi voluptatibus similique.', 43, 21, 0, '2018-12-10'),
(636, 'Ut cumque earum quam aut voluptas eligendi error. Quae consequatur qui consectetur harum. Saepe molestiae non laboriosam illo voluptatem expedita et incidunt. Qui nemo et est magni. Laborum a enim velit.', 61, 7, 0, '2018-12-10'),
(637, 'Magnam et eius rerum omnis eaque id. Maxime ea repudiandae sequi necessitatibus molestiae est. Provident aut nulla id voluptas qui qui.', 12, 12, 0, '2018-12-10'),
(638, 'Quia iure deleniti quibusdam. Deleniti sit consequatur quod repellendus consectetur eum. Dolore non omnis voluptates eum.', 39, 13, 0, '2018-12-10'),
(639, 'Suscipit molestiae est laudantium. Voluptatem eos ipsum quod velit vel voluptas et. Optio est labore quod occaecati.', 25, 11, 0, '2018-12-10'),
(640, 'Cum reiciendis ullam labore praesentium qui sed omnis. Id qui ut repellat eveniet repellat mollitia ducimus. Vel adipisci et in et accusamus consequuntur. Sunt debitis quam saepe vero aut nostrum.', 56, 5, 0, '2018-12-10'),
(641, 'Non eligendi et voluptatibus ipsa amet. Sapiente non fugiat et et enim commodi laudantium. Totam in atque nostrum omnis aut.', 24, 6, 0, '2018-12-10'),
(642, 'Veritatis et numquam quis optio sequi voluptatem dolorem modi. Error porro voluptates saepe eos. Porro sed magnam rerum sed dignissimos.', 44, 8, 0, '2018-12-10'),
(644, 'Ut quasi iste maxime molestiae consequuntur reprehenderit a. Quia omnis blanditiis dolorem et qui. Esse maiores accusamus sed pariatur. Expedita quisquam numquam voluptates omnis itaque ad.', 66, 3, 0, '2018-12-10'),
(645, 'Quas quaerat explicabo quod eaque. Eaque blanditiis ut molestias impedit sed numquam. Voluptatem nisi rerum cumque corporis illo.', 74, 11, 0, '2018-12-10'),
(647, 'Aspernatur enim enim sed aut laudantium. Voluptatum esse deserunt voluptas consequatur numquam est magnam. Vel ipsam ducimus eum autem magni optio placeat.', 62, 23, 0, '2018-12-10'),
(648, 'Ex corporis laudantium voluptatum aut. Sint quidem esse rerum modi rerum. Alias qui quaerat rerum quia. Ipsum quidem in in error et eaque.', 61, 11, 0, '2018-12-10'),
(649, 'Aut ducimus aut quo qui quod. Consequatur autem rerum ut et cupiditate. Aut sed cupiditate et excepturi.', 76, 25, 0, '2018-12-10'),
(650, 'Sed hic reprehenderit officiis voluptatem. Ex a nisi ea illum at reiciendis fugit.', 78, 12, 0, '2018-12-10'),
(651, 'Quis temporibus sequi aperiam et voluptas accusantium. Modi nostrum aut doloribus sed distinctio enim quo. Tempore praesentium magnam voluptas ad consequuntur et et.', 52, 23, 0, '2018-12-10'),
(652, 'Quia ullam suscipit nisi ex eaque quia. Voluptatem est labore voluptatum consequatur. Magnam quaerat ut sed omnis qui eligendi officia ducimus. Et maiores iure sed sunt qui facilis.', 54, 12, 0, '2018-12-10'),
(653, 'Id repudiandae sint et eaque molestias ullam et. Nesciunt omnis molestiae inventore labore. Ad pariatur debitis reprehenderit repudiandae. Minus facere quis ex expedita non aut enim.', 15, 19, 0, '2018-12-10'),
(654, 'Nihil a consequatur et distinctio dolores quam. In rerum eum ut velit. Ea aspernatur sit aperiam esse eligendi. Minus dicta minus suscipit perferendis incidunt inventore.', 5, 9, 0, '2018-12-10'),
(655, 'Minima temporibus distinctio quia dolores explicabo. Consectetur quis voluptate nobis et. Harum sint ea ipsam magnam.', 33, 6, 0, '2018-12-10'),
(656, 'Quisquam voluptas molestiae id iste amet eligendi voluptas. Excepturi ducimus modi possimus quia impedit.', 25, 15, 0, '2018-12-10'),
(657, 'Velit iusto dolorem in dolore. Exercitationem nihil qui est harum suscipit eligendi itaque. Maxime debitis occaecati sit voluptatem et vero. Ut quo in quia laudantium deserunt voluptate omnis.', 13, 22, 0, '2018-12-10'),
(658, 'Praesentium voluptatem delectus ea nulla et ea omnis. Eligendi corrupti quisquam quibusdam inventore quo dolorem impedit. Provident ducimus aut accusantium dolorem voluptas facilis. Labore amet et quaerat dicta reprehenderit.', 42, 1, 0, '2018-12-10'),
(659, 'Dolores incidunt id labore aut totam omnis qui. In saepe enim et ipsam. Aspernatur non suscipit eum. Animi pariatur impedit ducimus eum.', 14, 3, 0, '2018-12-10'),
(660, 'Vitae ea esse omnis provident quod sed tenetur. Maxime iure recusandae nulla et quidem. Tenetur sit necessitatibus possimus totam. Aut doloremque doloremque eum qui quaerat cupiditate beatae.', 33, 8, 0, '2018-12-10'),
(661, 'Iusto nulla omnis perferendis optio quidem. Occaecati rerum nihil animi commodi repudiandae. Dolor quis neque provident.', 5, 1, 0, '2018-12-10'),
(662, 'Doloremque veritatis consequatur autem est nisi perspiciatis alias consequatur. Est totam accusamus voluptatem veritatis. Aliquam est consectetur ab quod ipsa eum eaque. Occaecati ut debitis odio voluptate.', 43, 18, 0, '2018-12-10'),
(663, 'Eveniet architecto esse placeat. Saepe distinctio nobis occaecati quia sed asperiores. Ipsum itaque magnam accusamus numquam nihil porro perspiciatis.', 71, 14, 0, '2018-12-10'),
(664, 'Voluptates earum et numquam cupiditate placeat qui sapiente. Occaecati provident dolorem dolor saepe ullam saepe et earum. Rerum cupiditate magni nihil sint quia cumque.', 51, 2, 0, '2018-12-10'),
(665, 'Illum a nemo accusantium quod. Hic voluptas dicta nesciunt quia sed aliquid. Possimus culpa doloremque ea illum est quaerat ex. Dolor fuga quibusdam dignissimos. Consequatur qui eos autem quia et rem maiores.', 51, 20, 0, '2018-12-10'),
(666, 'Rerum in eveniet molestias aut inventore illo. Aut similique sed voluptas iusto. Incidunt deleniti est vero et ipsa.', 12, 5, 0, '2018-12-10'),
(667, 'Ducimus aut dicta qui quasi. In a id ea blanditiis. Recusandae odit voluptatem porro blanditiis sint.', 74, 5, 0, '2018-12-10'),
(668, 'Incidunt soluta repellendus perspiciatis. Corrupti nostrum dolorem molestiae perspiciatis eveniet quaerat ea. Voluptas doloribus ut aut rerum adipisci amet. Quibusdam voluptatem aliquid debitis autem ea.', 70, 6, 0, '2018-12-10'),
(669, 'hjkhjhjkhjhjjhkjj\r\n', 15, 1, 0, '2018-12-10'),
(670, 'hjkhjhjkhjhjjhkjj\r\n', 15, 1, 0, '2018-12-10'),
(671, 'hjkhjhjkhjhjjhkjj\r\n', 15, 1, 0, '2018-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `itemimages`
--

CREATE TABLE `itemimages` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemimages`
--

INSERT INTO `itemimages` (`id`, `item_id`, `image`) VALUES
(9, 24, '690643_2.JPG'),
(10, 24, '686957_1.jpg'),
(11, 25, '357175_10002193.jpg'),
(12, 25, '231962_30000768.jpg'),
(13, 25, '177379_FB_IMG_14894883987946035.jpg'),
(23, 14, '75681_1d57faacdb86ecdae6d80a5a24e3e509.jpg'),
(24, 14, '528080_2aa7d541883f4df85ffd382ae19f859e.jpg'),
(25, 43, '952926_2dfa7c8c3d22e6cc6b5cc38c9f435f16.jpg'),
(26, 43, '466845_5e99ab6f4d596fd49d12339673d69418.jpg'),
(27, 43, '182570_3acb7b8525f25d49e059cf7ad24d5c5c.jpg'),
(28, 43, '463675_6b3f0043d87506a853a3d0c7bec545ad.jpg'),
(29, 43, '579326_8b45d72d3172f74d4d716aaca137b678.jpg'),
(30, 46, '515510_8e9088fd329b66084450a334a40fc4d6.jpg'),
(31, 46, '660942_ba1e4f6229a761378f16649c845274b5.jpg'),
(32, 48, '107778_ed08666bd067bde4cb641081a6e8903e.jpg'),
(34, 73, '551867_79d8fe97b1ce17e6c3ccec3fed6a97f9.jpg'),
(35, 74, '114074_0fdd4a65504f0b0a75da62c99e7a2e92.jpg'),
(36, 77, '764773_f19b65b4212f9fdb32842ae8d57a52d3.jpg'),
(37, 78, '558769_7ae76309433a03a5852a52c2638ace07.jpg'),
(40, 12, '606727_f2.jpg'),
(41, 12, '801028_f3.jpg'),
(44, 15, '854501_f2.jpg'),
(45, 15, '757333_f3.jpg'),
(46, 24, '135106_1.jpg'),
(47, 24, '686845_2.jpg'),
(50, 25, '821491_1.jpg'),
(51, 25, '748900_2.jpg'),
(52, 34, '134215_5.jpg'),
(53, 34, '377729_4.jpg'),
(55, 51, '623017_5.jpg'),
(56, 51, '734433_4.jpg'),
(57, 52, '224349_4.jpg'),
(59, 64, '751664_f2.jpg'),
(60, 64, '838129_f1.jpg'),
(61, 11, '175465_f2.jpg'),
(62, 33, '207166_download.jpg'),
(63, 37, '36625_download (2).jpg'),
(64, 47, '403707_images (2).jpg'),
(65, 53, '250379_61TKWh6aoeL._SX425_.jpg'),
(66, 70, '516654_71JyLIXSfqL._SX425_.jpg'),
(67, 70, '799666_61TKWh6aoeL._SX425_.jpg'),
(68, 76, '198035_images (4).jpg'),
(69, 79, '112815_81VkYv65qUL._SX425_.jpg'),
(70, 50, '156116_car-engine-new1.jpg'),
(71, 58, '619395_download (3).jpg'),
(72, 66, '295175_curtis-1236-6301-hpevs-ac-12-brushless-ac-motor-kit-72-volt.jpg'),
(73, 66, '709075_ChevyVoltMotor.jpg'),
(74, 75, '142297_ChevyVoltMotor.jpg'),
(75, 75, '192708_car-engine-new1.jpg'),
(76, 75, '357834_download.jpg'),
(77, 5, '259650_386204-samsung-galaxy-s6-edge-t-mobile.jpg'),
(78, 6, '924033_images (1).jpg'),
(79, 6, '259436_images.jpg'),
(80, 10, '767228_a55e47cd4f5994498627735bdd27c0fb6c115c02_mobile-app-hero.jpg'),
(81, 39, '236596_Apple-iPhone-6-32GB-Space-SDL093654756-1-24c7d.jpg'),
(82, 44, '615534_multimedia-mobile-phone-500x500.jpg'),
(83, 67, '566206_images (1).jpg'),
(84, 67, '407373_a55e47cd4f5994498627735bdd27c0fb6c115c02_mobile-app-hero.jpg'),
(85, 56, '473512_images (4).jpg'),
(86, 56, '709371_images (4).jpg'),
(87, 56, '208927_images (3).jpg'),
(88, 68, '721690_images (2).jpg'),
(89, 68, '406371_images (1).jpg'),
(90, 68, '762393_SPD-CT201C63.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` varchar(255) DEFAULT NULL,
  `addDate` date NOT NULL,
  `countryMade` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `approve` tinyint(1) DEFAULT '0',
  `viewNum` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `price`, `addDate`, `countryMade`, `status`, `image`, `rating`, `cat_id`, `user_id`, `approve`, `viewNum`) VALUES
(5, 'walid elbehery', 'orem ipsum dolor sit amet, consectetur adipisicing elit. asdfasdfasdfsdfa asdfasdf sdfasfasdfasfasdfasdfasdfsd asdf asdf Distinctio, evenietsdf sdfsdfsdfsdfsdfsdf.\r\n', '13000', '2018-11-03', 'Djibouti', '1', '484751_181018-f-8e1a6400-1f5c-40ac-948c-ed86e74314a0.png', NULL, 13, 1, 1, 23),
(6, 'battery ', 'orem ipsum dolor sit amet, consectetur adipisicing elit. asdfasdfasdfsdfa asdfasdf sdfasfasdfasfasdfasdfasdfsd asdf asdf Distinctio, evenietsdf sdfsdfsdfsdfsdfsdf.', '12', '2018-11-03', 'Yemen', '1', '41279_images (1).jpg', NULL, 13, 1, 1, 25),
(10, ' Apple iPhone 7 with FaceTime - 32GB, 4G LTE, Black', 'Apple iPhone 7 has become a phone that defines what it means to be best in class. With the launch of the Apple iPhone 7 With FaceTime, Apple has showcased many innovative features. As always, Apple believes in minimalistic design, and it has created a single port through which you charge your phone, connect headphones, and even transfer data. The versatile A10 Fusion 64 bit ', '10,333.00', '2018-11-21', 'Afghanistan', '1', '188644_samsung-mobile-500x500.jpg', NULL, 13, 1, 1, 22),
(11, 'Fujifilm Instax Wide', 'Encase life moments instantly with the Fujifilm Instax Wide 210 Instant Camera. This instant camera is ideal for those who like framing snapped pictures. Clicking a picture with this analog camera is quick and easy. This camera comes along with a starter pack of Instax Wide Film that you can use to click a variety of awesome first images. You can kindle a passion for photography in', '1,495.00', '2018-11-21', 'Afghanistan', '1', '12821_3.jpg', NULL, 16, 1, 1, 95),
(12, ' Instax mini 9', 'Fujifilm Instax mini 9 Instant Film Camera, Lime Green \r\n\r\nA compact instant film camera, the White Instax mini from Fujifilm has been updated for sulfide shooters and features a range of convenient controls for producing credit card-sized prints. The sleek design incorporates a Fujinon 60mm focus 12.7 lens, which offers a fixed focus from 2\' to infinity, and a small sulfide mirror is', '1,696.00', '2018-11-21', 'Afghanistan', '1', '426659_f2.jpg', NULL, 16, 1, 1, 27),
(13, 'e4', '', '50', '2018-11-26', 'Bangladesh', '1', '748400_download.jpg', NULL, 14, 2, 0, 3),
(14, 'werrrr 7', '', '50', '2018-11-29', 'Afghanistan', '1', '744766_af5ee4c8214862dfd3f5b25019fd44f6.jpg', NULL, 10, 1, 0, 4),
(15, 'oil', '', '20', '2018-11-29', 'Afghanistan', '1', '846353_f1.jpg', NULL, 16, 1, 0, 0),
(24, 'oil', 'ddddddddddddddddddd dfddddddddd', '13000', '2018-11-30', 'Afghanistan', '1', '300931_1.jpg', NULL, 16, 1, 0, 47),
(25, 'test', 'dddddddddddd df d  ddd dddd  ddd dd', '50', '2018-12-09', 'Afghanistan', '1', '304706_2.jpg', NULL, 16, 1, 0, 2),
(27, 'beatae', 'Inventore quaerat omnis laudantium voluptatibus. Error saepe qui tempora labore maiores. Libero vero corporis sit sint libero autem optio. Laudantium quaerat corrupti omnis earum omnis optio.', '8406', '2018-12-10', 'Kazakhstan', '1', NULL, NULL, NULL, 26, 0, 0),
(31, 'exercitationem', 'Dolorem dignissimos optio in sint delectus quos maiores. Voluptatum velit illum quae. Ducimus cupiditate laborum minima inventore ducimus.', '62015', '2018-12-10', 'Madagascar', '3', '206674_images (3).jpg', NULL, 14, 13, 0, 0),
(33, 'dicta', 'Blanditiis quis veritatis et animi rerum. Et sint omnis repellat reprehenderit molestiae blanditiis quia. Vero totam sit nemo enim suscipit. Sint porro sed maxime iure et ipsum quisquam. Molestiae doloribus odio quam eligendi molestiae.', '80904', '2018-12-10', 'Burundi', '3', '153674_download (1).jpg', NULL, 12, 19, 0, 2),
(34, 'voluptatem', 'Ullam ut iusto consequatur nemo aut quod labore. Facilis consequatur voluptas illo odio molestias dolorem. Aut et nobis iste inventore pariatur iusto nisi dolores. Quas qui officiis quis voluptas voluptatem omnis.', '89753', '2018-12-10', 'Australia', '1', '997945_5.jpg', NULL, 16, 23, 0, 0),
(35, 'mollitia', 'Itaque laudantium temporibus odio quia ea. Voluptates est libero autem consequatur repellendus natus sed. Ullam consequuntur facilis odit qui. Rerum hic perspiciatis nisi distinctio. Sint maiores ipsam omnis ipsa rerum eligendi.', '63534', '2018-12-10', 'United States of America', '1', '481091_images (3).jpg', NULL, 1, 8, 0, 0),
(36, 'natus', 'Id modi magni nemo eum eligendi. Quae sint architecto ipsum debitis. Aut quis quia impedit voluptatem id maiores expedita. Vel saepe consectetur nihil et expedita.', '72467', '2018-12-10', 'Luxembourg', '4', '989091_1df229bd-8cdc-48ed-83f0-8360aacf2051.jpg', NULL, 15, 15, 0, 0),
(37, 'occaecati', 'Molestiae quaerat aut dolorem dolorum. Eligendi eius omnis ullam est aut. Ut aliquid commodi quis maxime nam.', '44199', '2018-12-10', 'Cocos (Keeling) Islands', '1', '362350_download (2).jpg', NULL, 12, 26, 0, 2),
(38, 'laborum', 'Odit voluptatem optio eos eum. Pariatur reprehenderit autem rem eum similique optio. Voluptatem dolores quo repellendus aut.', '44583', '2018-12-10', 'Azerbaijan', '4', '854656_download (1).jpg', NULL, 14, 30, 0, 0),
(39, 'cupiditate', 'Quaerat facilis ducimus cupiditate fugiat sunt molestiae molestiae. Esse illum omnis vel dolores qui. Dolore aut repellat occaecati laboriosam ut et. Autem aliquid molestiae ut omnis et et veniam.', '23735', '2018-12-10', 'Malta', '2', '644357_voice-v505-united-mobile-image-1.jpg', NULL, 13, 29, 0, 0),
(40, 'ut', 'Explicabo voluptas numquam dolor consequatur quae. Vel esse ratione sit voluptatem qui placeat culpa. Et eius ducimus et nisi amet eius. Eum qui quia ut in accusamus.', '58665', '2018-12-10', 'Madagascar', '1', '61234_motor-1.jpg', NULL, 1, 4, 0, 0),
(41, 'sint', 'Pariatur eveniet fugit laborum aut accusantium autem cum. Modi debitis et consequatur dolores eligendi aut. Saepe ex aut eaque.', '97032', '2018-12-10', 'Uzbekistan', '3', '592851_images (2).jpg', NULL, 14, 28, 0, 0),
(42, 'adipisci', 'Aliquid ratione ipsam commodi amet qui aliquid veniam. Quis eius aperiam pariatur et adipisci repellat nulla. Beatae mollitia sit ipsa iure sint.', '47803', '2018-12-10', 'Israel', '2', '504500_download (2).jpg', NULL, 14, 12, 0, 0),
(43, 'autem', 'Commodi tempora ipsum nobis voluptatem culpa ab quo. Dicta debitis ut nostrum consequatur provident dolore. Nobis quia sit qui optio. Quae ipsam quidem praesentium iste.', '80226', '2018-12-10', 'Dominican Republic', '3', '963539_06b3d54feaa84c695701e7b7e8df5e53.jpg', NULL, 10, 26, 0, 6),
(44, 'reprehenderit', 'Sit rem enim et consequuntur provident mollitia et. Natus in ducimus autem recusandae. Quam nulla dicta facere.', '7329', '2018-12-10', 'Zambia', '4', '618557_images (1).jpg', NULL, 13, 11, 0, 0),
(45, 'labore', 'Velit sapiente voluptate voluptas rerum voluptates quos enim. Et sequi eos vel voluptatem et omnis ut est.', '26464', '2018-12-10', 'Kiribati', '1', '460114_SPD-CT201C63.jpg', NULL, 1, 11, 0, 0),
(46, 'cumque', 'Temporibus molestias placeat culpa odit. Impedit voluptas quaerat atque est reprehenderit velit quisquam. Aperiam omnis aspernatur aliquid ipsam eum. Quia ut quia qui voluptatum perferendis.', '7348', '2018-12-10', 'Bosnia and Herzegovina', '3', '161814_8b45d72d3172f74d4d716aaca137b678.jpg', NULL, 10, 29, 0, 0),
(47, 'saepe', 'Eum animi blanditiis voluptates quos est doloribus iure. Tempore quam officiis est ipsa commodi ut nam molestias. Voluptatem doloremque enim harum ut blanditiis.', '16432', '2018-12-10', 'Cambodia', '2', '3592_images (2).jpg', NULL, 12, 11, 0, 1),
(48, 'quod', 'Vel mollitia magni quis incidunt minus. Aut omnis explicabo dolores tenetur dolorem. Quis velit ipsa quisquam et praesentium sint deserunt.', '52883', '2018-12-10', 'South Africa', '3', '904142_de42aa0509d2c47096f1f52605bc57ea.jpg', NULL, 10, 12, 0, 0),
(49, 'dolore', 'Fugit laudantium ab doloribus non deleniti. Accusantium voluptas dolorum ducimus quas culpa est recusandae et. Totam voluptatem laborum sit fugiat fugit perspiciatis quis. Dolorem minima et ipsum reiciendis.', '91631', '2018-12-10', 'Bahamas', '4', '454757_wire-cables-500x500.jpg', NULL, 1, 2, 0, 0),
(50, 'et', 'Accusantium excepturi veniam deserunt dolores. In vel laudantium molestiae dolorem ea veritatis sit debitis. Natus eaque voluptas qui temporibus delectus. Voluptatum nisi fuga sunt quia.', '90131', '2018-12-10', 'Tonga', '1', '255489_car-engine-new1.jpg', NULL, 15, 10, 0, 0),
(51, 'commodi', 'Id rerum veniam qui doloribus et inventore numquam. Natus quos reiciendis tempora vero doloremque. Distinctio sint labore aut. Est vel atque laboriosam minima voluptatum error.', '7649', '2018-12-10', 'Syrian Arab Republic', '2', '154175_4.jpg', NULL, 16, 28, 0, 0),
(52, 'eum', 'In eaque dolor nemo. Rem accusamus quo nam illum. Pariatur deserunt qui quis hic asperiores accusamus laudantium.', '5927', '2018-12-10', 'Somalia', '4', '18972_4.jpg', NULL, 16, 14, 0, 1),
(53, 'rerum', 'Ad minus qui itaque sit. Aut et nobis cumque itaque suscipit est. Rerum vero id debitis et delectus et.', '47833', '2018-12-10', 'Morocco', '1', '166553_61TKWh6aoeL._SX425_.jpg', NULL, 12, 19, 0, 0),
(54, 'magnam', 'Earum qui doloribus expedita quod esse. Corporis sapiente ratione praesentium exercitationem nemo illo eum. Alias dolorem ut sit laborum rerum qui. Magni ad alias laudantium eos omnis quod ut.', '95972', '2018-12-10', 'Luxembourg', '4', '289627_d49a7801b2291899377b72add7056aae.jpg', NULL, 10, 2, 0, 0),
(56, 'voluptatem', 'Sint numquam quia quia nam facilis vitae. Ullam voluptate fugiat magnam similique. Non ad aspernatur nam sed facilis perferendis. Repellat saepe saepe voluptas sed vel.', '64948', '2018-12-10', 'Bhutan', '3', '814544_images (3).jpg', NULL, 1, 17, 0, 0),
(57, 'odit', 'Suscipit rerum nostrum eaque eveniet sed odio neque. Cumque omnis ex laborum modi rem praesentium. In quia et nihil voluptas aut enim qui.', '19221', '2018-12-10', 'Monaco', '2', '816905_images (1).jpg', NULL, 14, 22, 0, 2),
(58, 'mollitia', 'Esse laudantium non molestias cum quo. Omnis et sunt voluptatem sunt voluptate error. Expedita dolores enim officiis praesentium. Nam alias necessitatibus rem modi consequatur.', '9583', '2018-12-10', 'Ghana', '2', '819476_download.jpg', NULL, 15, 28, 0, 0),
(59, 'sunt', 'Est architecto ad consequatur ducimus dicta consequatur. Omnis nulla sit eos sunt in reiciendis hic quia. Pariatur maiores neque aut aut sit.', '30196', '2018-12-10', 'Luxembourg', '4', '15564_3.jpg', NULL, 16, 15, 0, 0),
(60, 'et', 'Officiis architecto veritatis saepe iste et et et quis. Molestiae est quaerat est alias cumque eaque. Excepturi esse sequi molestias deleniti qui sit non.', '70858', '2018-12-10', 'Niger', '4', '539461_f3.jpg', NULL, 16, 16, 0, 0),
(61, 'sint', 'Laborum vel et labore facere quia. Impedit impedit quia velit et sed explicabo. Molestias et ut quam quia beatae odit aut. Quis facilis sint delectus delectus sit iusto earum.', '66363', '2018-12-10', 'United States Virgin Islands', '2', '759903_swipe-konnect-prime-4g-dual-sim-android-mobile-phone-grey-large_b31e452293b297b795feedcd82330ce6.jpg', NULL, 13, 15, 0, 0),
(62, 'officia', 'Enim corporis dignissimos error. Voluptatum asperiores non accusantium architecto et. Non error eum tempora voluptatem iusto.', '97687', '2018-12-10', 'Canada', '1', '508087_download (1).jpg', NULL, 14, 18, 0, 0),
(64, 'eligendi', 'Pariatur in quia sequi quibusdam voluptatem ducimus. Recusandae sint alias placeat ut. Illo ea explicabo illum voluptate autem porro nisi quos. Aperiam sit et eum similique.', '99368', '2018-12-10', 'Puerto Rico', '2', '733154_f1.jpg', NULL, 16, 11, 0, 4),
(65, 'est', 'Tenetur rem sed labore ducimus. Omnis magni eligendi placeat ut. Aut voluptatum vel labore cum reprehenderit aut excepturi maiores.', '52658', '2018-12-10', 'Turks and Caicos Islands', '1', '799796_images (2).jpg', NULL, 14, 29, 0, 0),
(66, 'dicta', 'Itaque ratione adipisci odio eaque. Quam est repudiandae ab aperiam. Aspernatur non exercitationem tempora quis incidunt. Molestiae quaerat omnis illum ut maiores et velit.', '56883', '2018-12-10', 'Ukraine', '1', '331052_curtis-1236-6301-hpevs-ac-12-brushless-ac-motor-kit-72-volt.jpg', NULL, 15, 30, 0, 3),
(67, 'cumque', 'At laborum sed nobis esse omnis officiis. Et assumenda temporibus vitae non consequatur placeat. Et aut ipsum repellat dolor. Suscipit est molestiae reiciendis nesciunt consequatur aspernatur.', '25267', '2018-12-10', 'Afghanistan', '4', '22676_Apple-iPhoneX-SpaceGray-1-3x.jpg', NULL, 13, 23, 0, 2),
(68, 'doloribus', 'Totam dolore dolore in iure odio. Veritatis unde voluptatem alias ut ea est. Praesentium ipsam qui sed. Ipsum maiores doloribus atque quia dignissimos. Aliquid ut est rem labore aperiam pariatur.', '72379', '2018-12-10', 'Mongolia', '3', '881620_images (1).jpg', NULL, 1, 18, 0, 0),
(69, 'voluptatem', 'Autem quibusdam vitae dolorum harum voluptatem. Unde necessitatibus consequuntur iure alias sit. Aut dolorum temporibus est molestiae qui.', '79820', '2018-12-10', 'Cuba', '1', '854204_engine_PNG6.png', NULL, 15, 17, 0, 0),
(70, 'quaerat', 'Eos et quia quibusdam ipsam quam. Molestias cum sint aut et. Sequi voluptatum eveniet ducimus dolores odio vel qui totam. Similique maiores numquam qui recusandae voluptates.', '75674', '2018-12-10', 'Libyan Arab Jamahiriya', '4', '618381_71JyLIXSfqL._SX425_.jpg', NULL, 12, 19, 0, 0),
(71, 'aperiam', 'Dolor quod qui voluptatibus et illo vero consequuntur. Quasi odio qui amet hic fugit accusantium in. Culpa ex quaerat molestias tenetur ex praesentium.', '40695', '2018-12-10', 'Greece', '1', '387418_engine2.jpg', NULL, 15, 25, 0, 0),
(72, 'et', 'Excepturi et voluptas error tempore quae. Eius placeat error voluptatem et optio quis voluptatem. Assumenda praesentium voluptatem porro aut.', '96086', '2018-12-10', 'Peru', '2', '355156_download (3).jpg', NULL, 15, 30, 0, 0),
(73, 'cumque', 'Ut asperiores corporis aliquid aperiam temporibus quo. Nisi voluptate eum repellat. Est blanditiis voluptas in deleniti vero commodi.', '99666', '2018-12-10', 'Senegal', '1', '157496_7ae76309433a03a5852a52c2638ace07.jpg', NULL, 10, 30, 0, 1),
(74, 'ex', 'Quia rerum odio fugit voluptatum distinctio. Recusandae nam quis suscipit. Id animi consectetur qui aliquid ut. Veniam et in tenetur consequatur praesentium nam commodi.', '36481', '2018-12-10', 'Gibraltar', '3', '603352_d1191489253803c0018d7ad52c9eb819.jpg', NULL, 10, 2, 0, 1),
(75, 'necessitatibus', 'Vero est delectus quia magni amet et occaecati quo. Tempore ducimus ut quam officiis.', '95714', '2018-12-10', 'Suriname', '4', '504978_car-engine-new1.jpg', NULL, 15, 21, 0, 1),
(76, 'dolore', 'Neque eveniet dolores provident aut dolorem illo fugiat. Iste sit corporis est dolorem culpa. Exercitationem sed enim perspiciatis eos.', '51417', '2018-12-10', 'Cuba', '4', '77465_images (4).jpg', NULL, 12, 21, 0, 0),
(77, 'velit', 'Fugiat et non optio eum unde quaerat. Molestiae ut non maiores voluptas ut rerum non. Inventore consequatur officia vitae non est. Aut et et est fuga voluptas voluptatibus quia porro.', '35980', '2018-12-10', 'Sao Tome and Principe', '1', '350317_a8cd69444f70abac28ad32959b5760c9.jpg', NULL, 10, 10, 0, 0),
(78, 'laudantium', 'Consectetur mollitia quo et. Ad voluptas aut voluptate porro harum corporis magni. Cumque atque et cumque odio aspernatur.', '19948', '2018-12-10', 'Switzerland', '1', '677007_5e99ab6f4d596fd49d12339673d69418.jpg', NULL, 10, 8, 0, 1),
(79, 'cum', 'Quia maiores ab aut. Error voluptate quidem vel sit hic. Fugiat hic debitis voluptas minus sit vitae. Esse velit et nisi cum impedit incidunt. Tempora molestiae eligendi molestiae vero dolorem id consectetur.', '50703', '2018-12-10', 'Bulgaria', '1', '618805_images.jpg', NULL, 12, 8, 0, 0),
(80, 'sint', 'Enim consequatur voluptas delectus. Odit dolor consequatur suscipit deleniti. Aut aut voluptatum modi ratione sit accusamus quo. Animi eos in sint explicabo qui et in.', '60264', '2018-12-10', 'Saudi Arabia', '2', '339399_images (1).jpg', NULL, 14, 21, 0, 0),
(81, 'nihil', 'Repudiandae illo est eligendi ullam cumque rerum dolor. Ducimus non enim quisquam sunt quae. Mollitia suscipit et quasi quia.', '40448', '2018-12-10', 'Botswana', '4', '562548_download (1).jpg', NULL, 12, 6, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `item_id`, `user_id`, `num`) VALUES
(2, 6, 1, 1),
(5, 11, 1, 2),
(6, 12, 1, 3),
(7, 5, 1, 2),
(8, 13, 1, 1),
(9, 15, 1, 1),
(10, 33, 1, 1),
(11, 53, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `avatar` varchar(300) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `regStatus` int(1) NOT NULL DEFAULT '0' COMMENT 'admin approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `userName`, `password`, `email`, `fullName`, `avatar`, `group_id`, `date`, `regStatus`) VALUES
(1, 'walid', '', 'iam66walid@gmail.com', 'walid gomaa  elbehery', '423690_billgates.jpg', 1, '2019-01-03 12:26:43', 1),
(2, 'ali1', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ledoledo750@gmail.com', 'ali gomaaddd dcss', '433286_download (1).jpg', 0, '2018-12-10 23:28:00', 1),
(3, 'waliddggggg', '9062ff4fb860c9c664ac7380b471f2a44c038238', 'ee@g.comdd', 'ali gomaaddd dcss', '882552_download.jpg', 0, '2018-12-10 23:28:10', 0),
(4, 'tschuster', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'angeline29@yahoo.com', 'Amanda Goodwin', '444524_human-776185_960_720.jpg', 0, '2018-12-10 23:28:20', 1),
(5, 'tommie.hand', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'coy.muller@yahoo.com', 'Bernadette McKenzie', '398211_images (1).jpg', 0, '2018-12-10 23:28:35', 1),
(6, 'josh97', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'vwalter@gmail.com', 'Mrs. Virginia Homenick', '', 0, '2018-12-10 15:58:01', 1),
(7, 'joana.pfeffer', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'shields.lesley@gmail.com', 'Miss Frances Rempel DVM', '286258_melanie-person.jpg', 0, '2018-12-12 22:03:33', 1),
(8, 'trycia.simonis', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'deron02@gmail.com', 'Nannie Von', '', 0, '2018-12-10 15:58:01', 1),
(9, 'funk.delbert', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'santos.hirthe@gmail.com', 'Charlotte Kris', '', 0, '2018-12-10 15:58:01', 1),
(10, 'hkoss', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'klesch@hotmail.com', 'Prof. Jazmyne Feest MD', '', 0, '2018-12-10 15:58:01', 1),
(11, 'jake.mitchell', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'taurean56@gmail.com', 'Frieda Runolfsson', '', 0, '2018-12-10 15:58:01', 1),
(12, 'ftremblay', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'xmcglynn@gmail.com', 'Jayson DuBuque', '206455_images (3).jpg', 0, '2018-12-10 23:29:26', 1),
(13, 'qbrekke', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'fherman@hotmail.com', 'Yvonne Macejkovic', '', 0, '2018-12-10 15:58:01', 1),
(14, 'robel.bartholome', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'giovanna.bednar@yahoo.com', 'Percival Grant', '', 0, '2018-12-10 15:58:01', 1),
(15, 'anderson.effertz', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'collins.imani@hotmail.com', 'Kira Ernser MD', '', 0, '2018-12-10 15:58:01', 1),
(16, 'brown.mosciski', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'fisher.brent@yahoo.com', 'Mr. Kane Prosacco', '', 0, '2018-12-10 15:58:01', 1),
(17, 'vkeebler', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'daugherty.chad@yahoo.com', 'Cierra Blanda', '', 0, '2018-12-10 15:58:01', 1),
(18, 'baumbach.florine', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'wilhelmine36@gmail.com', 'Nicklaus Mosciski', '', 0, '2018-12-10 15:58:01', 1),
(19, 'natalia.okeefe', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'smarks@hotmail.com', 'Cortez Kuhlman', '606359_images (1).jpg', 0, '2018-12-10 23:29:37', 1),
(20, 'colten35', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ymorar@hotmail.com', 'Waylon Welch', '', 0, '2018-12-10 15:58:01', 1),
(21, 'mabelle26', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'bernhard18@yahoo.com', 'Cayla Wunsch IV', '', 0, '2018-12-10 15:58:01', 1),
(22, 'libbie31', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'homenick.bailee@hotmail.com', 'Palma Kuvalis V', '', 0, '2018-12-10 15:58:01', 1),
(23, 'breitenberg.merlin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'nat66@gmail.com', 'Rosina Weber', '', 0, '2018-12-10 15:58:01', 1),
(24, 'haley.davis', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'katelin.jones@hotmail.com', 'Prof. Aisha Pfannerstill Sr.', '792260_download (1).jpg', 0, '2018-12-10 23:30:47', 1),
(25, 'bayer.clark', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'shirley.lueilwitz@yahoo.com', 'Greg Nicolas', '702522_images (2).jpg', 0, '2018-12-10 23:29:14', 1),
(26, 'hjacobi', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ulises54@gmail.com', 'Dulce Thiel', '23993_images.jpg', 0, '2018-12-10 23:30:57', 1),
(27, 'brekke.ena', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ubednar@yahoo.com', 'Bradley Hagenes', '937844_images (3).jpg', 0, '2018-12-10 23:29:03', 1),
(28, 'lizzie91', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'nzulauf@yahoo.com', 'Eda O\'Conner', '', 0, '2018-12-10 15:58:01', 1),
(29, 'mclaughlin.vena', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'xjenkins@yahoo.com', 'Janelle Stiedemann III', '617268_images.jpg', 0, '2018-12-10 23:28:52', 1),
(30, 'xabbott', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'rachel81@gmail.com', 'Halie Willms', '707461_melanie-person.jpg', 0, '2018-12-10 23:28:44', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_cat` (`name`),
  ADD KEY `fkParentID` (`parent`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user` (`user_id`),
  ADD KEY `comment_item` (`item_id`);

--
-- Indexes for table `itemimages`
--
ALTER TABLE `itemimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_1` (`user_id`),
  ADD KEY `cat_1` (`cat_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_key` (`item_id`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=672;

--
-- AUTO_INCREMENT for table `itemimages`
--
ALTER TABLE `itemimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fkParentID` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemimages`
--
ALTER TABLE `itemimages`
  ADD CONSTRAINT `cat_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `item_key` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
