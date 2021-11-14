
class ApiRoutes {
  static final String _baseUrl = 'https://newsapi.org/v1/articles';
  static final String _newsApiKey = '1c0f731cca954a13875e6965f9c7e9de';

  static String getTheNextWebNews() => '$_baseUrl?source=the-next-web&apiKey=$_newsApiKey';
  static String getAssociatedPressNews() => '$_baseUrl?source=associated-press&apiKey=$_newsApiKey';
}