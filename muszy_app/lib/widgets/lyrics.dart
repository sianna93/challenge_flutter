import 'package:flutter/material.dart';
import 'package:muszy_app/theme/app-theme.dart';


class LyricsWidget extends StatefulWidget {
  List<String>lyrics = [];
  double scrollPosition;
  double maxValue;


  LyricsWidget({required this.lyrics, this.scrollPosition = 0, this.maxValue = 0});

  @override
  LyricsState createState() => LyricsState();
}

class LyricsState extends State<LyricsWidget> {

  late ScrollController _scrollController;
  late double _relation = 1;
  late double maxHeigthItem = 44.943;
  late double maxScroll = 0;
  late double offset = 0;

  _scrollListener() {
    setState(() {
      widget.scrollPosition = _scrollController.offset/_relation;
      offset = _scrollController.offset;

     /* print("pixels ${_scrollController.position.pixels}");
      print("maxScrollExtent ${_scrollController.position.maxScrollExtent}");
      print("minScrollExtent ${_scrollController.position.minScrollExtent}");
      print("offset ${_scrollController.offset}");*/

    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (_scrollController.positions.isNotEmpty) {
      _relation = _scrollController.position.maxScrollExtent / widget.maxValue;
      //_scrollController.jumpTo(widget.scrollPosition);
      _scrollController.animateTo(widget.scrollPosition * _relation, duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    }

    return Expanded(
        child: Container(
            // height: 150.0,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.lyrics.length,
                padding: EdgeInsets.all(0.0),
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                      padding:  index < widget.lyrics.length - 1 ? EdgeInsets.only(right: 15.0) : EdgeInsets.all(0),
                      child: LyricItem(lyricLine: widget.lyrics[index], index: index, total: widget.lyrics.length, offset: offset,)
                  );

                },


            )
        )

    );

  }

}

class LyricItem extends StatefulWidget{
  final String lyricLine;
  int index = 0;
  int total = 0;
  double offset;

  LyricItem({required this.lyricLine, this.index = 0, this.total = 0, this.offset = 0});

  @override
  LyricItemState createState() => LyricItemState();

}


class LyricItemState extends State<LyricItem> {
  bool isHide = false;
  double heigthContent = 19.3921568;//20.60375;
  GlobalKey itemKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => { getSizeContent()});
    }


  }

  getSizeContent() async{
    if (itemKey.currentContext != null) {
      RenderBox? contentBox = itemKey.currentContext!.findRenderObject() as RenderBox?;
      heigthContent = contentBox != null ? contentBox.size.height : 19.3921568;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // ScreenUtil

    return Container(
      key: itemKey,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:   _getFirstWord(4),
            style: TextStyle(//context.size!.height
                color:  isFirstLine(heigthContent) ? AppTheme.kBackground_blue3: _getColorInactive(heigthContent)  ,
                fontSize: 15.0, fontWeight: FontWeight.bold),
            children:  <TextSpan>[
              TextSpan(
                text:  " ${_getLastWords(4)}",
                style: TextStyle(color:  _getColorInactive(heigthContent), fontSize: 15.0, fontWeight: FontWeight.bold)
              )
            ],
          ),
      )
    );
  }

  double minValue(double heigthItem) {
    return widget.index > 0 ? widget.index - 1 + heigthItem : 0;
  }

  double maxValue(double heigthItem) {
    return widget.index < widget.total ? widget.index + heigthItem : 0;
  }

  bool isFirstLine(double heigthItem) {
    if (widget.offset < heigthContent) {
      if (widget.index == 0 ) {
        return true;
      } else {
        return (widget.offset / heigthContent).floor() == widget.index;
      }
    }

    return widget.offset < heigthContent && widget.index == 0 ? true : ( widget.offset / heigthContent).ceil() == widget.index;
  }

  String _getFirstWord(int end){
    var splitList = widget.lyricLine.split(" ");
    var size = splitList.length - 1 ;
    var newArr = splitList.getRange(0, end < size ? end : size + 1) ;
    return newArr.join(" ");
  }

  String _getLastWords(int init){
    var splitList = widget.lyricLine.split(" ");
    var size = splitList.length - 1 ;
    if ((init > -1 && init < size)) {
      var newArr = splitList.getRange((init > -1 && init < size) ? init : size, size+1);
      return newArr.join(" ");
    }
    return "";
  }

  Color _getColorInactive(heigthItem){
    int indexOffset = widget.offset < heigthContent ? ( widget.offset / heigthContent).floor() : ( widget.offset / heigthContent).ceil();
    if (!isFirstLine(heigthItem)) {
      return widget.index > indexOffset && widget.index < indexOffset + 5  ?  Colors.white : AppTheme.kSubtitle;
    } else {
      int nextIndex = widget.index + 5;
      if (nextIndex < widget.total ) {

        return widget.index > nextIndex ? AppTheme.kSubtitle : Colors.white;
      }
    }

    return (widget.index != 0 && (widget.index > 5) ) ? AppTheme.kSubtitle : Colors.white;
  }

}