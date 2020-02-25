def forward(self, sentences: tensor, lengths: tensor):
    embeds = self.word_embeddings(sentences)
    x_packed = rnn_utils.pack_padded_sequence(embeds, lengths, batch_first=self.batch_first)
    lstm_out, (h_n, h_c) = self.lstm(x_packed, none)
    lstm_out_unpacked, lstm_out_lengths = rnn_utils.pad_packed_sequence(lstm_out, batch_first=self.batch_first)
    if self.use_gpu:
        lstm_out_lengths = lstm_out_lengths.cuda()
    last_lstm_out = self.last_output(lstm_out_unpacked, lstm_out_lengths)
    y = self.hidden2label(last_lstm_out)
    return y
