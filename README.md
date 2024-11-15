# Ответы на вопросы в задании
### *Вопрос 1.* Какие проблемы мешают нам использовать storyboards в реальных проектах?
- При большом количестве ограничений в storyboards становится сложно (нереально) следить за ними по отдельности.
- В storyboards часто появляются внезапные баги, которые никак не зависят от программиста.
- Storyboards реализован через XML формат, поэтому почти невозможно нормально отслеживать контроль версий.

### *Вопрос 2.* Что делает код в строках 25 и 29?
1. `title.translatesAutoresizingMaskIntoConstraints = false` – отключает autoresizing masks, чтобы можно было задавать собственные ограничения через auto layout.
2. `view.addSubview(title)` – добавляет `title` в основное представление `view`. Если по простому: отображает title в пользовательком интерфейсе.

### *Вопрос 3.* Что такое safe area layout guide?
Это безопасная зона, внутри которой можно размещать пользовательские элементы. Например "челка" с камерой не входит в эту безопасную зону. Она автоматически масштабируется и адаптируется под разные устройства и разные положения (горизонтальные или вертикальные), поэтому ее очень удобно использовать вместе со своими ограничениями. 
