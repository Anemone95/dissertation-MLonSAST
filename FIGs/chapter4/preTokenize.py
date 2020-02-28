def build_dict(dataset: TextDataset, freq_gt: int) -> WordTokenDict:
    _dict = WordTokenDict()
    word_freq = {}
    for sentence, label in dataset:
        for word in sentence.split():
            word = word.strip()
            if word in word_freq:
                word_freq[word] += 1
            else:
                word_freq[word] = 1
    for word, freq in word_freq.items():
        if freq > freq_gt:
            _dict.add_word(word)
    return _dict

def encode(string: str, _dict: WordTokenDict) -> [int]:
    words = string.split()
    encoded = map(lambda e: _dict.wtoi(e.strip()), words)
    return list(encoded)
