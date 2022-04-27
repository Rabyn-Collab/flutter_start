import 'package:flutter_projects_start/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final newsProvider = FutureProvider((ref) => NewsService.getNews(query: 'nasa'));