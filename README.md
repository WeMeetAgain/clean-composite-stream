# clean-composite-stream

clean-composite-stream is a composite stream, a stream composed of streams, which closes its constituent streams when it is closed.

According to the [CLHS entry on `close`](http://www.lispworks.com/documentation/HyperSpec/Body/f_close.htm):

> The effect of close on a constructed stream is to close the argument stream only. There is no effect on the constituents of composite streams.

This library explicitly ignores this, indeed, that is its sole purpose.

## Example

```lisp
;;; make a new clean-composite-stream

(make-instance 'clean-composite-stream
               :composite-stream (apply #'concatenated-stream streams)
               :constituent-streams streams)

;;;

(with-open-stream (stream (make-clean-concatenated-stream stream1 stream2 ...))
  ...)

;;; the created composite stream will close its constituent streams
```

## License

MIT
