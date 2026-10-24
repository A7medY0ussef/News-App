abstract final class DateHelper{
  static String timeAgo(String? publishedAt) {
    final date = DateTime.tryParse(publishedAt ?? '');
    if (date == null) return 'unknown';

    final diff = DateTime.now().difference(date);

    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }
}