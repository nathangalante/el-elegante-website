export default function Set(props) {
    return (
        <>
            <div>
                <iframe
                    width="320px"
                    className="widget"
                    height="160px"
                    scrolling="no"
                    position="sticky"
                    top="0"
                    frameBorder="yes"
                    src={props.url}
                ></iframe>
            </div>
        </>
    );
}
