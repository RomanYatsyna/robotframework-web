from urllib.parse import quote


def convert_to_url_format(to_convert):
    return quote(to_convert)
