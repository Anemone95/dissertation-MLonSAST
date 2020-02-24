def collate_fn(tokenizer, data: [(str, int)]):
    X, Y = 0, 1
    data = list(map(lambda e: (torch.LongTensor(tokenizer.encode(e[X])), e[Y]), data))
    data.sort(key=lambda x: len(x[X]), reverse=True)
    data_x = list(map(lambda e: e[X], data))
    data_lengths = torch.LongTensor([len(sq) for sq in data_x])
    data_x = rnn_utils.pad_sequence(data_x, batch_first=True, padding_value=PADDING_VALUE)
    data_y = torch.LongTensor(list(map(lambda e: e[Y], data)))
    return data_x, data_lengths, data_y
